class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|

    	t.string :description, null: false
    	t.integer :business_id, null: false
    	t.string :percentage_revenue_increase

      t.timestamps null: false
    end
  end
end
