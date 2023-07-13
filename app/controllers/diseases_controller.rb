class DiseasesController < BaseController
  before_action :set_breadcrumbs

  def index
    @pagy, @diseases = pagy(current_user.account.diseases.all)
  end

  def new
    @disease = current_user.account.diseases.new
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name.capitalize, d.id] }

    add_breadcrumb("Nowa choroba", new_disease_path)
  end

  def create
    @predefined_diseases = PredefinedDisease.all.map { |d| [d.name.capitalize, d.id] }
    @disease = current_user.account.diseases.new(disease_params)

    if @disease.save
      redirect_to diseases_path, notice: "Choroba została dodana."
    else
      render :new
    end
  end

  def set_breadcrumbs
    add_breadcrumb("Home", authenticated_root_path)
    add_breadcrumb("Choroby", diseases_path)
  end

  private

  def disease_params
    params.require(:disease).permit(:diagnosed_at, :diagnosed_by_hp, :severity, :color,
                                    :predefined_disease_id)
  end
end
