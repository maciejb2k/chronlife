class MeasurementsController < BaseController
  before_action :set_measurement, only: %i[show edit update destroy]
  before_action :set_datetime, only: %i[show_by_day generate_raport_by_day]
  before_action :set_breadcrumbs

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

  def show_by_day
    @pagy, @measurements = pagy(
      @measurements =
        current_account
        .measurements
        .includes(measurement_type: :unit)
        .where(measurement_date: @selected_datetime.all_day)
        .order(measurement_date: :asc)
    )
  end

  def new
    measurement_type = MeasurementType.find_by!(name: params[:measurement_type])
    @measurement = Measurement.new(measurement_type:)
  end

  def create
    # find_by! or find_by and handling the error by myself - which is better?
    measurement_type = MeasurementType.find_by!(name: params[:measurement_type])

    @measurement = current_account.measurements.build(measurement_params)
    @measurement.measurement_type = measurement_type
    validation_context = get_validation_context(measurement_type.name)

    respond_to do |format|
      if @measurement.valid?(validation_context)
        @measurement.save
        format.html do
          flash[:success] = t(".success")
          redirect_to measurements_path
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      validation_context = get_validation_context(@measurement.measurement_type.name)
      if @measurement.update_with_context(measurement_params, validation_context)
        format.html { redirect_to measurement_url(@measurement), notice: t(".success") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to measurements_url, notice: t(".success") }
    end
  end

  private

  def set_measurement
    @measurement = current_account.measurements.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:value, :measurement_date)
  end

  def get_validation_context(measurement_type)
    "measurement_#{measurement_type}".to_sym
  end

  def set_datetime
    @selected_datetime = parse_date(params[:day])

    return unless @selected_datetime.nil?

    flash[:error] = t(".invalid_date")
    redirect_to measurements_path
  end

  def parse_date(date)
    Date.parse(date)
  rescue TypeError, Date::Error
    nil
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), measurements_path

    case action_name.to_sym
    when :new, :create
      set_breadcrumbs_new
    when :show
      add_breadcrumb(
        t(".breadcrumbs.show", date: l(@measurement.measurement_date, format: "%d %B %Yr.")),
        measurement_path(params[:id])
      )
    when :show_by_day
      add_breadcrumb(
        t(".breadcrumbs.show_by_day", date: parse_date(params[:day])),
        show_by_day_measurements_path(day: params[:day])
      )
    end
  end

  def set_breadcrumbs_new
    case params[:measurement_type].to_sym
    when :weight
      add_breadcrumb t(".breadcrumbs.new.weight"),
                     new_measurements_path(measurement_type: :weight)
    when :heart_beat
      add_breadcrumb t(".breadcrumbs.new.heart_beat"),
                     new_measurements_path(measurement_type: :heart_beat)
    when :blood_pressure
      add_breadcrumb t(".breadcrumbs.new.blood_pressure"),
                     new_measurements_path(measurement_type: :blood_pressure)
    when :sugar
      add_breadcrumb t(".breadcrumbs.new.sugar"),
                     new_measurements_path(measurement_type: :sugar)
    when :spo2
      add_breadcrumb t(".breadcrumbs.new.spo2"),
                     new_measurements_path(measurement_type: :spo2)
    end
  end
end
