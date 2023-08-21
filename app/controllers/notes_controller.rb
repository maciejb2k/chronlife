class NotesController < BaseController
  layout "dashboard"

  before_action :set_note, only: %i[show edit update destroy pin unpin add_tag remove_tag]
  before_action :set_tags, only: %i[show edit add_tag]
  before_action :set_tags_options, only: %i[show edit add_tag]

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_new, only: %i[new create]
  before_action :set_breadcrumbs_show, only: %i[show]
  before_action :set_breadcrumbs_edit, only: %i[edit update]

  def index
    notes = current_account.notes.order(created_at: :desc)

    if params[:tag_id].present?
      tag = current_account.note_tags.find_by(id: params[:tag_id])
      notes = tag ? notes.joins(:note_tag_associations).where(note_tag_associations: { note_tag_id: tag.id }) : []
    end

    pinned_notes = notes.where(is_pinned: true)
    unpinned_notes = notes.where(is_pinned: false)
    tags = current_account.note_tags.order(:name)

    @pagy_pinned, @notes_pinned = pagy(pinned_notes)
    @pagy_all, @notes = pagy(unpinned_notes)
    @pagy_tags, @tags = pagy(tags)
  end

  def show
    @note_tag = @note.tags.build
    @pagy, @note_tags = pagy(@note.note_tag_associations)
  end

  def new
    @note = Note.new
  end

  def edit; end

  def create
    @note = current_account.notes.build(note_params)

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
    @note.is_pinned = true
    @note.save(touch: false)

    redirect_to notes_path
  end

  def unpin
    @note.is_pinned = false
    @note.save(touch: false)

    redirect_to notes_path
  end

  def add_tag
    @tag = current_account.note_tags.find(add_tag_params[:note_tag_id])

    respond_to do |format|
      @note.tags << @tag

      format.html do
        redirect_to note_path(@note)
      end
    rescue ActiveRecord::RecordInvalid => e
      @error_message = e.record.errors.messages_for(:note_tag_id).first

      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@note, partial: "note_tag_associations/form")
      end
      format.html { redirect_to note_path(@note) }
    end
  end

  def remove_tag
    @tag = current_account.note_tags.find(remove_tag_params[:note_tag_id])
    @note.tags.delete(@tag)

    respond_to do |format|
      format.html { redirect_to note_path(@note) }
      format.json { head :no_content }
    end
  end

  private

  def set_note
    @note = current_account.notes.find(params[:id])
  end

  def set_tags
    @tags = current_account.note_tags
  end

  def set_tags_options
    @tags_options = @tags.map { |tag| [tag.name, tag.id] }
  end

  def note_params
    params.require(:note).permit(:title, :content, :background_color, :is_pinned)
  end

  def add_tag_params
    params.require(:note).permit(:note_tag_id)
  end

  def remove_tag_params
    params.permit(:note_tag_id)
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
