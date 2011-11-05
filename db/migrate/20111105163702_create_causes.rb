class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
