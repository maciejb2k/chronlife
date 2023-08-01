class NoteTagsController < ApplicationController
  layout "dashboard"

  before_action :set_note_tag, only: %i[edit update destroy]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def new
    @note_tag = NoteTag.new
  end

  def create
    @note_tag = current_user.account.note_tags.build(note_tag_params)

    respond_to do |format|
      if @note_tag.save
        format.html { redirect_to notes_path, notice: "Tag została poprawnie utworzony." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note_tag.update(note_tag_params)
        format.html { redirect_to note_tag_url(@note_tag), notice: "Tag został poprawnie zaktualizowany." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note_tag.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Tag został poprawnie usunięty." }
      format.json { head :no_content }
    end
  end

  private

  def note_tag_params
    params.require(:note_tag).permit(:name)
  end

  def set_note_tag
    @note_tag = current_user.account.note_tags.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("notatki", notes_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("nowa notatka", new_note_path)
  end

  def set_breadcrumbs_edit
    add_breadcrumb("edytuj tag", edit_note_tag_path(@note_tag))
  end
end
