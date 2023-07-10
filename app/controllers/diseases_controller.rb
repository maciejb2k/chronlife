class DiseasesController < BaseController
  layout "dashboard"

  def index
    @diseases = current_user.account.diseases.all.includes(:diseases)
  end
end
