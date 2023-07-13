module ApplicationHelper
  include Pagy::Frontend

  def user_full_name
    return unless current_user

    "#{current_user.account.first_name} #{current_user.account.last_name}"
  end

  def user_username
    return unless current_user

    "@#{current_user.account.username}"
  end
end
