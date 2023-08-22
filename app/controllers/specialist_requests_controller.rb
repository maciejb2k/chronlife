class SpecialistRequestsController < BaseController
  before_action :set_specialist_request, only: %i[show edit update destroy]
  before_action :check_request_sent, only: %i[new create]
  before_action :set_breadcrumbs

  def index
    @pagy, @specialist_requests = pagy(
      current_account.specialist_requests.order(created_at: :desc)
    )
  end

  def new
    @specialist_request = SpecialistRequest.new
  end

  def create
    @specialist_request = current_account.specialist_requests.build(specialist_request_params)

    respond_to do |format|
      if @specialist_request.save
        format.html { redirect_to specialist_requests_path, notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @specialist_request.destroy

    respond_to do |format|
      format.html { redirect_to specialist_requests_url, t(".success") }
    end
  end

  private

  def set_specialist_request
    @specialist_request = SpecialistRequest.find(params[:id])
  end

  def specialist_request_params
    params.require(:specialist_request).permit(:specialization, :specialization_description,
                                               :field_of_expertise)
  end

  def check_request_sent
    return unless pending_request?

    redirect_to specialist_requests_path, alert: t(".check_request_sent")
  end

  def pending_request?
    current_account.specialist_requests.where(status: :pending).any?
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), specialist_requests_path
  end
end
