class Owner < User

  def editable_by? user
    owner == user
  end
end

