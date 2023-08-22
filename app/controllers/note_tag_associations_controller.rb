class NoteTagAssociationsController < BaseController
  before_action :set_note
  before_action :set_note_tag_association, only: %i[destroy]
  before_action :set_tags_list, only: %i[new create]

  def index
    load_note_tag_associations
  end

  def new
    @note_tag_association = @note.note_tag_associations.build
  end

  def create
    @note_tag_association = @note.note_tag_associations.build(note_tag_association_params)

    respond_to do |format|
      if @note_tag_association.save
        format.turbo_stream { load_note_tag_associations }
        format.html { redirect_to @note, notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note_tag_association = @note.note_tag_associations.find(params[:id])
    @note_tag_association.destroy

    respond_to do |format|
      format.turbo_stream { load_note_tag_associations }
      format.html { redirect_to @note, notice: t(".success") }
    end
  end

  private

  def set_note
    @note = current_account.notes.find(params[:note_id])
  end

  def set_note_tag_association
    @note_tag_association = @note.note_tag_associations.find(params[:id])
  end

  def set_tags_list
    @tags_options = current_account.note_tags.map { |tag| [tag.name, tag.id] }
  end

  def load_note_tag_associations
    @pagy, @note_tags = pagy(@note.note_tag_associations)
  end

  def note_tag_association_params
    params.require(:note_tag_association).permit(:note_tag_id)
  end
end
