class Admin::SpecialistRequestsController < Admin::BaseController
  before_action :set_admin_specialist_request, only: %i[show edit update destroy approve reject]

  def index
    @admin_specialist_requests = SpecialistRequest.where(status: "pending").all
  end

  def new
    @admin_specialist_request = SpecialistRequest.new
  end

  def create
    @admin_specialist_request = SpecialistRequest.new(admin_specialist_request_params)

    respond_to do |format|
      if @admin_specialist_request.save
        format.html do
          redirect_to admin_specialist_request_url(@admin_specialist_request), notice: t(".success")
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin_specialist_request.update(admin_specialist_request_params)
        format.html do
          redirect_to admin_specialist_request_url(@admin_specialist_request), notice: t(".success")
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_specialist_request.destroy

    respond_to do |format|
      format.html do
        redirect_to admin_specialist_requests_url, notice: t(".success")
      end
    end
  end

  def approve
    @admin_specialist_request.approve!

    respond_to do |format|
      format.html do
        redirect_to admin_specialist_requests_url, notice: t(".success")
      end
    end
  end

  def reject
    @admin_specialist_request.reject!

    respond_to do |format|
      format.html do
        redirect_to admin_specialist_requests_url, notice: t(".success")
      end
    end
  end

  private

  def set_admin_specialist_request
    @admin_specialist_request = SpecialistRequest.find(params[:id])
  end

  def admin_specialist_request_params
    params.fetch(:admin_specialist_request, {})
  end
end
