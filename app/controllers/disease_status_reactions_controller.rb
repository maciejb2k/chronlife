class DiseaseStatusReactionsController < BaseController
  before_action :set_reactable

  def index
    @reactions = @disease_status.reactions.size
  end

  def like
    authorize @disease_status, :like?
    @reaction = @disease_status.reactions.build(reaction_type: "like")
    @reaction.account = current_account

    if @reaction.save!
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @disease_status }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def unlike
    authorize @disease_status, :unlike?
    @reaction = @disease_status.reactions.find_by!(account: current_account)
    @reaction.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @disease_status }
    end
  end

  private

  def set_reactable
    @disease = Disease.find(params[:disease_id])
    @disease_status = DiseaseStatus.find(params[:status_id])
  end

  def reaction_params
    params.require(:disease_status_reaction).permit(:reaction_type)
  end
end
