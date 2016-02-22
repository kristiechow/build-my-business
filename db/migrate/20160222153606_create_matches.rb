class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :user, index: true, foreign_key: true
      t.references :matched_user, index: true
      t.string     :accepted, :default => "false"
      t.string     :status, default: "Pending"

      t.timestamps null: false
    end

    add_foreign_key :matches, :users, column: :matched_user_id
    add_index :matches, [:user_id, :matched_user_id], unique: true
  end
end
