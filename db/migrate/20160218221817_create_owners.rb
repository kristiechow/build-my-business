class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :first_name, null: false
   	  t.string :last_name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :description
      t.string :skills
      t.string :avatar
      t.string :location
      t.string :contact_info

      t.timestamps null: false
    end
  end
end
