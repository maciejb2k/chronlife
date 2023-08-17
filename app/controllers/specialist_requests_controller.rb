class SpecialistRequestsController < BaseController
  before_action :set_specialist_request, only: %i[show edit update destroy]
  before_action :request_sent?, only: %i[new create]
  before_action :set_breadcrumbs

  def index
    @pagy, @specialist_requests = pagy(current_account.specialist_requests.order(created_at: :desc))
  end

  def show; end

  def new
    @specialist_request = SpecialistRequest.new
  end

  def edit; end

  def create
    @specialist_request = current_account.specialist_requests.build(specialist_request_params)

    respond_to do |format|
      if @specialist_request.save
        format.html do
          redirect_to specialist_requests_path,
                      notice: "Poprawnie wysłano wniosek o status specjalisty."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @specialist_request.destroy

    respond_to do |format|
      format.html do
        redirect_to specialist_requests_url,
                    notice: "Specialist request was successfully destroyed."
      end
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

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("wnioski o status specjalisty", specialists_path)
  end

  def pending_request?
    current_account.specialist_requests.where(status: :pending).any?
  end

  def request_sent?
    return unless pending_request?

    redirect_to specialist_requests_path,
                alert: "Wniosek o status specjalisty został już wysłany."
  end
end
