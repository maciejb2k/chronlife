class MeasurementsController < BaseController
  layout "dashboard"

  before_action :set_measurement, only: %i[show edit update destroy]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]

  def index
    @measurements = Measurement.all
  end

  def show; end

  def show_by_day
    @selected_day = Date.parse(params[:day])
    @measurements = current_user.account.measurements.where(measured_at: @selected_day.all_day)
  end

  def new
    measurement_type = MeasurementType.find_by!(name: params[:measurement_type])
    @measurement = Measurement.new(measurement_type:)
  end

  def edit; end

  def create
    measurement_type = MeasurementType.find_by!(name: params[:measurement_type])
    @measurement = current_user.account.measurements.build(measurement_params)
    @measurement.measurement_type = measurement_type

    case params[:measurement_type].to_sym
    when :weight
      @measurement.valid?(:measurement_weight)
    when :heart_beat
      @measurement.valid?(:measurement_heart_beat)
    when :blood_pressure
      @measurement.valid?(:measurement_blood_pressure)
    when :sugar
      @measurement.valid?(:measurement_sugar)
    when :spo2
      @measurement.valid?(:measurement_spo2)
    end

    respond_to do |format|
      if @measurement.errors.empty?
        format.html do
          redirect_to measurements_path, notice: "Measurement was successfully created."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @measurement.update(measurement_params)
        format.html do
          redirect_to measurement_url(@measurement), notice: "Measurement was successfully updated."
        end
        format.json { render :show, status: :ok, location: @measurement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @measurement.destroy

    respond_to do |format|
      format.html do
        redirect_to measurements_url, notice: "Measurement was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  def set_measurement
    @measurement = current_user.account.measurements.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:value, :measurement_date)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("monitorowanie zdrowia", diseases_path)
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
end
