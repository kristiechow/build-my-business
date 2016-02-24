class AddContactInfoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :skype_id, :string
  	add_column :users, :slack_id, :string
  	add_column :users, :phone_number, :string
  end
end
