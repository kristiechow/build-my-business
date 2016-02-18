class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :description, null: false
      t.string :skills
      t.string :avatar
      t.string :location
      t.string :contact_info, null: false

      t.timestamps null: false
    end
  end
end
