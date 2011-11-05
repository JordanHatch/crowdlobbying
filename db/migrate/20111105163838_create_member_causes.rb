class CreateMemberCauses < ActiveRecord::Migration
  def change
    create_table :member_causes do |t|
      t.references :member
      t.references :cause
      t.float :average_rating, :default => 0
      t.integer :report_count, :default => 0
      t.timestamps
    end
  end
end
