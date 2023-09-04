class MeasurementRaportsController < BaseController
  before_action :set_measurement_raport, only: %i[show destroy]
  before_action :set_breadcrumbs

  def index
    @pagy, @raports = pagy(current_account.measurement_raports)
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        send_data(
          StringIO.new(@measurement_raport.attachment.open.read),
          filename: @measurement_raport.attachment.metadata[:filename],
          content_type: "application/pdf"
        )
      end
    end
  end

  def generate_for_day
    Measurements::GenerateDayRaportJob.perform_async(params[:day], current_account.id)

    respond_to do |format|
      format.html do
        redirect_to measurement_raports_path, notice: t(".success")
      end
    end
  end

  def destroy
    @measurement_raport.destroy

    respond_to do |format|
      format.html do
        redirect_to measurement_raports_path, notice: t(".success")
      end
    end
  end

  private

  def set_measurement_raport
    @measurement_raport = current_account.measurement_raports.find(params[:id])
  end

  def set_rack_response((status, headers, body))
    self.status = status
    self.headers.merge!(headers)
    self.response_body = body
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t("measurements.breadcrumbs.index"), measurements_path
    add_breadcrumb t(".breadcrumbs.index"), measurement_raports_path
  end
end
