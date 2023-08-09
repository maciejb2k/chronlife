class ReactionsController < BaseController
  def create
    @reaction = @reactable.comments.build comment_params
    @reaction.account = current_account
    @reaction.save!

    redirect_to @reactable, notice: "Reaction set!"
  end

  private

  def reaction_params
    params.require(:reaction).permit(:type)
  end
end
