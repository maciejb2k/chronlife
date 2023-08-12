class Groups::BaseController < BaseController
  before_action :set_group
  before_action :set_breadcrumbs
  before_action :authorize_group!

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_breadcrumbs
    add_breadcrumb "home", groups_path
    add_breadcrumb "grupy chorych", groups_path
    add_breadcrumb @group.predefined_disease.name
  end

  def authorize_group!
    return if current_account.groups.include?(@group)

    redirect_to root_path
  end
end
