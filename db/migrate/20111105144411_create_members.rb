class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :telephone
      t.string :email         
      t.float :average_rating
      t.integer :report_count
      t.references :party
      t.timestamps
    end
  end
end
