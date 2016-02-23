class Owner < User
  has_one :business

  def editable_by? user
    self.id == user.id
  end



end

