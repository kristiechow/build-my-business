class Developer < User
  has_many :businesses
  has_and_belongs_to_many :skills, association_foreign_key: 'skill_id', join_table: 'developers_skills'
  # has_many :developer_skills, dependent: :destroy
  # has_many :skills, through: :developer_skills

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
