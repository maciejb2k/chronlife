class DiseasesController < BaseController
  before_action :set_breadcrumbs

  def index
    @diseases = current_user.account.diseases.all.includes(:diseases)
  end

  def new
    add_breadcrumb("Nowa choroba", new_disease_path)
  end

  def set_breadcrumbs
    add_breadcrumb("Home", authenticated_root_path)
    add_breadcrumb("Choroby", diseases_path)
  end
end
