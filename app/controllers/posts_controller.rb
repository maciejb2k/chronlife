class PostsController < BaseController
  layout "dashboard"

  before_action :set_account

  def index
    @pagy, @posts = pagy(
      DiseaseStatus
      .joins(:disease)
      .where(disease: { account_id: @account.id })
      .includes(:disease, :comments, :reactions, disease: %i[predefined_disease account])
      .order(created_at: :desc),
      items: 10
    )
  end

  def destroy; end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end
end
