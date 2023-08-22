class Groups::DiseasePhotosController < Groups::BaseController
  before_action :set_breadcrumbs

  def index
    @pagy, @photos = pagy(
      DiseasePhoto
      .joins(disease: :account)
      .includes(disease: :account)
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease })
    )
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("groups.disease_photos_controller.breadcrumbs.index"),
                   group_disease_photos_path(@group)
  end
end
