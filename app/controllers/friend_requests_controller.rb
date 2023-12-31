class FriendRequestsController < BaseController
  before_action :set_friend_request, only: %i[update destroy]
  before_action :set_breadcrumbs

  def index
    prepare_request_lists
  end

  # TODO: Refactor responses
  def create
    friend = Account.find(params[:account_id])
    @friend_request = current_account.sent_friend_requests.build(friend:)

    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to accounts_path, notice: t(".success") }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # TODO: Refactor responses
  def update
    respond_to do |format|
      if @friend_request.accept
        format.html do
          redirect_to friend_requests_path, notice: t(".success")
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend_request.destroy

    respond_to do |format|
      message = t(".success")

      format.turbo_stream do
        flash.now[:notice] = message
        prepare_request_lists
      end
      format.html do
        redirect_to friend_requests_path, notice: message
      end
    end
  end

  private

  def prepare_request_lists
    @pagy_incoming, @incoming = pagy(
      current_account.received_friend_requests.includes(:account)
    )
    @pagy_outgoing, @outgoing = pagy(
      current_account.sent_friend_requests.includes(:friend)
    )
  end

  def set_friend_request
    @friend_request = current_account.all_friend_requests.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), friend_requests_path
  end
end
