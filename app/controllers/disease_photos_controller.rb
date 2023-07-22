class DiseasePhotosController < BaseController
  layout "dashboard"

  before_action :set_disease
  before_action :set_disease_photo, only: %i[edit update destroy]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]

  def index
    @pagy, @disease_photos = pagy(@disease.photos.order(created_at: :desc), items: 12)
  end

  def new
    @disease_photo = DiseasePhoto.new
  end

  def create
    @disease_photo = @disease.photos.build(disease_photo_params)

    respond_to do |format|
      if @disease_photo.save
        format.html do
          redirect_to disease_disease_photos_path,
                      notice: "Zdjęcie zostało poprawnie dodane."
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @disease_photo.destroy

    respond_to do |format|
      format.html do
        redirect_to disease_disease_photos_path, notice: "Zdjęcie zostało poprawnie usunięte."
      end
    end
  end

  private

  def set_disease
    @disease = current_user.account.diseases.find(params[:disease_id])
  end

  def set_disease_photo
    @disease_photo = @disease.photos.find(params[:id])
  end

  def disease_photo_params
    params.require(:disease_photo).permit(:image, :caption)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("choroby", diseases_path)
    add_breadcrumb(@disease.predefined_disease.name, @disease)
    add_breadcrumb("zdjęcia", disease_disease_photos_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("dodaj zdjęcie", new_disease_disease_photo_path(@disease, @disease_photo))
  end
end
