class Skill < ActiveRecord::Base
  has_and_belongs_to_many :developers, association_foreign_key: 'developer_id', join_table: 'developers_skills'
end
