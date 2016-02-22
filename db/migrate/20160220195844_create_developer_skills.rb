class CreateDeveloperSkills < ActiveRecord::Migration
  def change
    create_table :developer_skills do |t|
      t.integer :developer_id
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
