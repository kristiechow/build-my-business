class Developer < User

  def editable_by? user
    self.id == user.id
  end
end
