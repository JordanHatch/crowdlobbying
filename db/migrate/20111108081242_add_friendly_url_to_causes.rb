class AddFriendlyUrlToCauses < ActiveRecord::Migration
  def change   
    add_column :causes, :friendly_url, :string
  end
end
