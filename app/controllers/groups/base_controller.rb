class Groups::BaseController < BaseController
  before_action :set_group
  before_action :set_base_breadcrumbs
  before_action :authorize_group!

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_base_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), groups_path
    add_breadcrumb t("groups.base_controller.breadcrumbs.index"), groups_path
    add_breadcrumb @group.predefined_disease.name, group_posts_path(@group)
  end

  def authorize_group!
    return if current_account.groups.include?(@group)

    redirect_to root_path
  end
end
