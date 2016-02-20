module UserHelper
  def user_path(user)
    if user.type == "Owner"
      return owner_path(user)
    else
      return developer_path(user)
    end
  end

  def has_avatar? user
    user.avatar.present?
  end

  def editable_by? user
    user == current_user
  end
end
