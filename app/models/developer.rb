class Developer < User
  has_many :businesses
  has_many :developer_skills
  has_many :skills, through: :developer_skills

  def editable_by? user
    self.id == user.id
  end

  def self.search(skill)
    if Skill.find_by(name: skill)
      Skill.find_by(name: skill).developers
    else
      []
    end
  end

end
