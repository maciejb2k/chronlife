class Groups::PostReactionsController < Groups::BaseController
  before_action :set_reactable

  def index
    @reactions = @post.reactions.size
  end

  def like
    @reaction = @post.reactions.build(reaction_type: "like")
    @reaction.account = current_account

    if @reaction.save!
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @post }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def unlike
    @reaction = @post.reactions.find_by!(account: current_account)
    @reaction.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private

  def set_reactable
    @post = GroupPost.find(params[:post_id])
  end

  def reaction_params
    params.require(:post).permit(:reaction_type)
  end
end
