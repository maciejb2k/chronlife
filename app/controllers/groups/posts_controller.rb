class Groups::PostsController < Groups::BaseController
  def index
    set_posts
    set_liked_posts
  end

  def new
    @group_post = GroupPost.new
  end

  def create
    @post = @group.posts.build(post_params)
    @post.account = current_account

    if @post.save
      respond_to do |format|
        format.turbo_stream do
          set_posts
          set_liked_posts
        end
        format.html { redirect_to group_posts_path(@group), notice: "Post created successfully" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_posts
    @pagy, @posts = pagy(@group.posts.order(created_at: :desc))
  end

  def set_liked_posts
    @liked_posts = Reaction.where(
      account: current_account,
      reaction_type: "like",
      reactable_type: "GroupPost"
    ).pluck(:reactable_id)
  end

  def post_params
    params.require(:group_post).permit(:body)
  end
end
