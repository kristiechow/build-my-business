class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment, null: false
      t.integer :communication_rating, null: false
      t.integer :quality_rating, null: false
      t.integer :timeliness_rating, null: false
      t.string :review_type, null: false
      t.references :reviewee, index: true
      t.references :reviewer, index: true

      t.timestamps null: false
    end
  end
end
