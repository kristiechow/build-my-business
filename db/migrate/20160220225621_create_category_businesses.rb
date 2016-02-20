class CreateCategoryBusinesses < ActiveRecord::Migration
  def change
    create_table :category_businesses do |t|
      t.integer :category_id
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
