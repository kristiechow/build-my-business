class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :business, index: true
      t.references :status_update, index: true

      t.timestamps null: false
    end
  end
end
