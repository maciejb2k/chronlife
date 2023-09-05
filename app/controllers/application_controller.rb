class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :breadcrumbs

  def current_account
    @current_account ||= current_user.account
  end

  def breadcrumbs
    @breadcrumbs ||= []
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name, path)
  end

  private

  def user_not_authorized
    message = t("application.not_authorized")

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update(
          :dash_toast,
          partial: "shared/dash_toast",
          locals: { message:, icon: "error" }
        )
      end
      format.html do
        flash[:error] = message
        redirect_to root_path
      end
    end
  end
end
