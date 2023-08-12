class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

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
end
