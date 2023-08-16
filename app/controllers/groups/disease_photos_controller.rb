class Groups::DiseasePhotosController < Groups::BaseController
  def index
    @pagy, @photos = pagy(
      DiseasePhoto
      .joins(disease: :account)
      .includes(disease: :account)
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease })
    )
  end
end
