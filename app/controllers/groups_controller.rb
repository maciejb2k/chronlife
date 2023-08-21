class GroupsController < BaseController
  before_action :set_group, only: %i[show join_group leave_group]
  before_action :set_breadcrumbs

  def index
    @pagy_account, @account_groups = pagy(
      current_account.groups
    )

    @pagy_available, @available_groups = pagy(
      Group
      .where(predefined_disease_id: current_account.diseases.pluck(:predefined_disease_id))
      .where.not(id: current_account.groups.pluck(:id))
      .joins(:predefined_disease)
      .includes(:predefined_disease)
    )

    @avaliable_groups_ids = @available_groups.map(&:id)
  end

  def join_group
    @group.accounts << current_account

    respond_to do |format|
      format.html { redirect_to groups_path, notice: t(".success") }
    end
  end

  def leave_group
    @group.accounts.delete(current_account)

    respond_to do |format|
      format.html { redirect_to groups_path, notice: t(".success") }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), groups_path

    case action_name.to_sym
    when :show
      add_breadcrumb @group.predefined_disease.name, @group
    end
  end
end
