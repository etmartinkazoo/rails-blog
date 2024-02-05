module ApplicationHelper
  def admin?(user)
    user && user.role_ids.include?(1)
  end
  def editor?
    current_user && current_user.role_ids.include?(2)
  end
  def user?
    current_user && current_user.role_ids.include?(3)
  end
end
