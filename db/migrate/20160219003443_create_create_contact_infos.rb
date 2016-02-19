class CreateCreateContactInfos < ActiveRecord::Migration
  def change
    create_table :create_contact_infos do |t|
      t.string :skype_id
      t.string :slack_id
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
