module UserHelper
  def user_path(user)
    if user.type == "Owner"
      return owner_path(user)
    else
      return developer_path(user)
    end
  end


end
