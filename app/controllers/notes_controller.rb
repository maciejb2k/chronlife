class NotesController < BaseController
  before_action :set_note, only: %i[show edit update destroy pin unpin]
  before_action :set_tags, only: %i[show edit add_tag]
  before_action :set_breadcrumbs

  def index
    notes = current_account.notes.order(created_at: :desc)

    if params[:tag_id].present?
      tag = current_account.note_tags.find_by(id: params[:tag_id])
      query = notes.joins(:note_tag_associations)
                   .where(note_tag_associations: { note_tag_id: tag.id })
      notes = tag ? query : []
    end

    pinned_notes = notes.where(is_pinned: true)
    unpinned_notes = notes.where(is_pinned: false)
    tags = current_account.note_tags.order(:name)

    @pagy_pinned, @notes_pinned = pagy(pinned_notes, page_param: :pinned_page)
    @pagy_all, @notes = pagy(unpinned_notes, page_param: :unpinned_page)
    @pagy_tags, @tags = pagy(tags, page_param: :tags_page)
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_account.notes.build(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: t(".success") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: t(".success") }
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

  private

  def set_note
    @note = current_account.notes.find(params[:id])
  end

  def set_tags
    @tags = current_account.note_tags
  end

  def note_params
    params.require(:note).permit(:title, :content, :background_color, :is_pinned)
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), notes_path

    case action_name.to_sym
    when :new, :create
      add_breadcrumb t(".breadcrumbs.new"), new_note_path
    when :show
      add_breadcrumb @note.title, @note
    when :edit, :update
      add_breadcrumb @note.title, @note
      add_breadcrumb t(".breadcrumbs.edit"), edit_note_path(@note)
    end
  end
end
