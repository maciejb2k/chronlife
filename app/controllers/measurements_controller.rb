class MeasurementsController < BaseController
  layout "dashboard"

  before_action :set_measurement, only: %i[show edit update destroy]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show edit update]
  after_action :set_breadcrumbs_show_by_day, only: %i[show_by_day]

  def index
    @latest_measurements =
      current_account
      .measurements
      .includes(measurement_type: :unit)
      .joins(measurement_type: :unit)
      .order("measurement_types.name, measurement_date DESC")
      .select("DISTINCT ON (measurement_types.name) measurements.*")

    @latest = {}

    Measurement::TYPES.each do |type|
      latest_measurement = @latest_measurements.find do |m|
        m.measurement_type.name == type.to_s
      end
      @latest[type.to_sym] = latest_measurement
    end

    @measurements = current_account.measurements.group_by_day(:measurement_date).count
  end

  def show; end

  def show_by_day
    @selected_datetime = Date.parse(params[:day])
    @pagy, @measurements = pagy(
      current_account.measurements.includes(measurement_type: :unit).where(
        measurement_date: @selected_datetime.all_day
      ).order(measurement_date: :asc)
    )
    set_breadcrumbs_show_by_day
  rescue ArgumentError, TypeError
    flash[:error] = "Nieprawidłowa data pomiaru."
    redirect_to measurements_path
  end

  def new
    measurement_type = MeasurementType.find_by!(name: params[:measurement_type])
    @measurement = Measurement.new(measurement_type:)
  end

  def edit; end

  def create
    # find_by! or find_by and handling the error by myself - which is better?
    measurement_type = MeasurementType.find_by!(name: params[:measurement_type])

    @measurement = current_account.measurements.build(measurement_params)
    @measurement.measurement_type = measurement_type

    validation_key = generate_validation_key(@measurement.measurement_type.name)

    respond_to do |format|
      if @measurement.valid?(validation_key)
        @measurement.save

        format.html do
          flash[:success] = "Pomiar został poprawnie dodany."
          redirect_to measurements_path
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    validation_key = generate_validation_key(@measurement.measurement_type.name)

    respond_to do |format|
      if @measurement.update_with_context(measurement_params, validation_key)

        format.html do
          redirect_to measurement_url(@measurement),
                      notice: "Pomiar został poprawnie zaktualizowany."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measurement.destroy

    respond_to do |format|
      format.html do
        redirect_to measurements_url, notice: "Pomiar został poprawnie usunięty."
      end
      format.json { head :no_content }
    end
  end

  private

  def set_measurement
    @measurement = current_account.measurements.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:value, :measurement_date)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("monitorowanie zdrowia", measurements_path)
  end

  def set_breadcrumbs_new
    case params[:measurement_type].to_sym
    when :weight
      add_breadcrumb(
        "pomiar wagi",
        new_measurements_path(measurement_type: :weight)
      )
    when :heart_beat
      add_breadcrumb(
        "pomiar tętna",
        new_measurements_path(measurement_type: :heart_beat)
      )
    when :blood_pressure
      add_breadcrumb(
        "pomiar ciśnienia krwi",
        new_measurements_path(measurement_type: :blood_pressure)
      )
    when :sugar
      add_breadcrumb(
        "pomiar cukru",
        new_measurements_path(measurement_type: :sugar)
      )
    when :spo2
      add_breadcrumb(
        "pomiar saturacji krwi",
        new_measurements_path(measurement_type: :spo2)
      )
    end
  end

  def set_breadcrumbs_show
    add_breadcrumb(
      "pomiar z #{l(@measurement.measurement_date, format: '%d %B %Yr.')}",
      measurement_path(params[:id])
    )
  end

  def set_breadcrumbs_show_by_day
    add_breadcrumb(
      "pomiary z dnia #{@selected_datetime}",
      show_by_day_measurements_path(day: params[:day])
    )
  end

  def generate_validation_key(measurement_type)
    "measurement_#{measurement_type}".to_sym
  end
end
