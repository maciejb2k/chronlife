class CommentsController < BaseController
  def create
    @comment = @commentable.comments.new comment_params
    @comment.account = current_account
    @comment.save

    redirect_to @commentable, notice: "Comment created"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
