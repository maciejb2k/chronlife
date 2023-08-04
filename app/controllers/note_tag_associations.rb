class NoteTagAssociations < BaseController
  before_action :set_note
  before_action :set_note_tag_association, only: %i[destroy]

  def create
    @note_tag_association = current_account.note_tag_associations.build(note_tag_association_params)

    respond_to do |format|
      if @note_tag_association.save
        format.html do
          redirect_to notes_path(@note)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note_tag_association.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = current_account.notes.find(params[:note_id])
  end

  def set_note_tag_association
    @note_tag_association = @note.note_tag_associations.find(params[:id])
  end

  def note_tag_association_params
    params.require(:note_tag_association).permit(:note_tag_id)
  end
end
