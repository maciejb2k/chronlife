class PostsController < BaseController
  layout "dashboard"

  before_action :set_account

  def index
    @pagy, @posts = pagy(
      DiseaseStatus
      .joins(:disease)
      .where(disease: { account_id: @account.id })
      .includes(:reactions, comments: :account, disease: :account)
      .order(created_at: :desc),
      items: 1
    )
  end

  def destroy; end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end
end
