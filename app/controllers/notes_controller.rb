class NotesController < ApplicationController
  layout "dashboard"

  before_action :set_note, only: %i[show edit update destroy pin unpin]
  before_action :set_tags, only: %i[show edit add_tag]
  before_action :set_tags_options, only: %i[show edit add_tag]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def index
    notes = current_user.account.notes.order(created_at: :desc)

    if params[:tag_id].present?
      tag = current_user.account.note_tags.find_by(id: params[:tag_id])
      notes = tag ? notes.joins(:note_tag_associations).where(note_tag_associations: { note_tag_id: tag.id }) : []
    end

    pinned_notes = notes.where(is_pinned: true)
    unpinned_notes = notes.where(is_pinned: false)
    tags = current_user.account.note_tags.order(:name)

    @pagy_pinned, @notes_pinned = pagy(pinned_notes)
    @pagy_all, @notes = pagy(unpinned_notes)
    @pagy_tags, @tags = pagy(tags)
  end

  def show
    @note_tag_association = NoteTagAssociation.new
    @pagy, @note_tags = pagy(@note.note_tag_associations)
  end

  def new
    @note = Note.new
  end

  def edit; end

  def create
    @note = current_user.account.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: "Notatka została poprawnie utworzona." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Notatka została poprawnie edytowana." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def pin
    @note.update(is_pinned: true)
    redirect_to notes_path
  end

  def unpin
    @note.update(is_pinned: false)
    redirect_to notes_path
  end

  def add_tag
    @note_tag = current_user.account.note_tags.find(params[:note_tag_id])

    @note.note_tags << @note_tag

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def remove_tag
    @note_tag = current_user.account.note_tags.find(params[:note_tag_id])

    @note.note_tags.delete(@note_tag)

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = current_user.account.notes.find(params[:id])
  end

  def set_tags
    @tags = current_user.account.note_tags
  end

  def set_tags_options
    @tags_options = @tags.map { |tag| [tag.name, tag.id] }
  end

  def note_params
    params.require(:note).permit(:title, :content, :background_color, :is_pinned)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("notatki", notes_path)
  end

  def set_breadcrumbs_new
    add_breadcrumb("nowa notatka", new_note_path)
  end

  def set_breadcrumbs_show
    add_breadcrumb(@note.title, @note)
  end

  def set_breadcrumbs_edit
    add_breadcrumb("edytuj notatkę", edit_note_path(@note))
  end
end
