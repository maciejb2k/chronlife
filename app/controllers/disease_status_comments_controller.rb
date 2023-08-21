class DiseaseStatusCommentsController < BaseController
  include DiseaseSettable

  before_action :set_commentable
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @pagy, @comments = pagy_countless(
      @disease_status
      .comments
      .joins(:account)
      .includes(:account)
      .order(updated_at: :desc),
      items: 3
    )

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def create
    @comment = @disease_status.comments.build comment_params
    @comment.account = current_account

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to @disease_status, notice: t(".success") }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            :dash_toast,
            partial: "shared/dash_toast",
            locals: { message: @comment.errors.full_messages.first, icon: "error" }
          )
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream
        format.html { redirect_to @comment, notice: t(".success") }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(
            :dash_toast,
            partial: "shared/dash_toast",
            locals: { message: @comment.errors.full_messages.first, icon: "error" }
          )
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @comment
    @comment.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @disease_status, notice: t(".success") }
    end
  end

  private

  def set_commentable
    @disease_status = DiseaseStatus.find(params[:status_id])
  end

  def set_comment
    @comment = @disease_status.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
