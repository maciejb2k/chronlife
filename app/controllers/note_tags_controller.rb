class NoteTagsController < BaseController
  before_action :set_note_tag, only: %i[edit update destroy]
  before_action :set_breadcrumbs

  def new
    @note_tag = NoteTag.new
  end

  def create
    @note_tag = current_account.note_tags.build(note_tag_params)

    respond_to do |format|
      if @note_tag.save
        format.html { redirect_to notes_path, notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note_tag.update(note_tag_params)
        format.html { redirect_to note_tag_url(@note_tag), notice: t(".success") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note_tag.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: t(".success") }
    end
  end

  private

  def note_tag_params
    params.require(:note_tag).permit(:name)
  end

  def set_note_tag
    @note_tag = current_account.note_tags.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t("notes.breadcrumbs.index"), notes_path

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_note_tag_path
    when :edit, :update
      add_breadcrumb @note_tag.name, @note_tag
      add_breadcrumb t(".breadcrumbs.edit"), edit_note_tag_path(@note_tag)
    end
  end
end
