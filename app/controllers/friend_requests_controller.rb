class FriendRequestsController < BaseController
  before_action :set_friend_request, except: %i[index new create]
  before_action :set_breadcrumbs

  def index
    @pagy_incoming, @incoming = pagy(FriendRequest.where(friend: current_account))
    @pagy_outgoing, @outgoing = pagy(current_account.friend_requests)
  end

  def create
    friend = Account.find(params[:account_id])
    @friend_request = current_account.friend_requests.build(friend:)

    respond_to do |format|
      if @friend_request.save
        format.html { redirect_to accounts_path, notice: "Zaproszenie zostało wysłane." }
      else
        flash.now[:error] = "Nieprawidłowy kod weryfikacyjny. Spróbuj ponownie."

        format.turbo_stream do
          render turbo_stream: turbo_stream.update(:flash, partial: "shared/dash_flash")
        end
        format.html { render plain: "Nie udało się wysłać zaproszenia" }
      end
    end
  end

  def update
    respond_to do |format|
      if @friend_request.accept
        format.html do
          redirect_to friend_requests_path, notice: "Zaproszenie zostało poprawnie zaakceptowane."
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @friend_request.destroy

    respond_to do |format|
      format.html do
        redirect_to friend_requests_path, notice: "Zaproszenie zostało poprawnie usunięte."
      end
    end
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:friend_id)
  end

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb "Home", authenticated_root_path
    add_breadcrumb "Zaproszenia do znajomych", friend_requests_path
  end
end
