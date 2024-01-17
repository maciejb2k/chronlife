class DiseasePhotosController < BaseController
  include DiseaseSettable

  before_action :set_disease_photo, only: %i[destroy]
  before_action :set_breadcrumbs

  def index
    @pagy, @disease_photos = pagy(
      @disease.photos.order(created_at: :desc), items: 12
    )
  end

  def new
    @disease_photo = DiseasePhoto.new
  end

  def create
    @disease_photo = @disease.photos.build(disease_photo_params)

    respond_to do |format|
      if @disease_photo.save
        format.html do
          redirect_to disease_photos_path, notice: t(".success")
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
        redirect_to disease_photos_path, notice: t(".success")
      end
    end
  end

  private

  def set_disease_photo
    @disease_photo = @disease.photos.find(params[:id])
  end

  def disease_photo_params
    params.require(:disease_photo).permit(:image, :caption)
  end

  def set_breadcrumbs
    add_breadcrumb t("diseases.breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t("diseases.breadcrumbs.index"), diseases_path
    add_breadcrumb @disease.predefined_disease.name, @disease
    add_breadcrumb t(".breadcrumbs.index"), disease_risk_factors_path

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_disease_photo_path
    end
  end
end
