class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :member_cause
      t.references :member
      t.text :description
      t.integer :rating
      t.timestamps
    end
  end
end
