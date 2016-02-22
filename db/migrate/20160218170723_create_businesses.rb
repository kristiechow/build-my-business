class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :location, null: false
      t.string :status_update
      t.references :owner, index: true

      t.timestamps null: false
    end
  end
end
