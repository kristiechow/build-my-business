class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.references :from_user, index: true
      t.references :to_user, index: true

      t.timestamps null: false
    end
  end
end
