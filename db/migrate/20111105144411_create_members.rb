class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :telephone
      t.string :email                
      t.string :constituency
      t.string :photo_url     
      t.references :party
      t.timestamps
    end
  end
end
