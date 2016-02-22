class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :password_digest, null: false
      t.string :description
      t.string :location
      t.string :type

      t.timestamps null: false
    end
  end
end
