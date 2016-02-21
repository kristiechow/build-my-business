class AddDeveloperToBusiness < ActiveRecord::Migration
  def change
  	add_reference :businesses, :developer, index: true
  end
end
