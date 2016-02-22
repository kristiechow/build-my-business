class Owner < User

  def editable_by? user
    self.id == user.id
  end

  def closed_match?
    a = self.received_matches.where(status: "Matched!")
    b = self.sent_matches.where(status: "Matched!")
    a.concat(b)
    # binding.pry
    return true if a.length >= 3
  end



end

