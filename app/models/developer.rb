class Developer < User
  has_many :businesses
  has_and_belongs_to_many :skills, association_foreign_key: 'skill_id', join_table: 'developers_skills'

  def editable_by? user
    self.id == user.id
  end

end
