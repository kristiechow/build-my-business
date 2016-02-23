class CreateDevelopersSkills < ActiveRecord::Migration
  def change
    create_table :developers_skills do |t|
      t.integer :developer_id
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
