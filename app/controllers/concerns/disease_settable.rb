module DiseaseSettable
  extend ActiveSupport::Concern

  included do
    before_action :set_disease
  end

  private

  def set_disease
    @disease = current_account.diseases.find(params[:disease_id])
  end
end
