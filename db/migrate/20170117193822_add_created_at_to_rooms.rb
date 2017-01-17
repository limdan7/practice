class AddCreatedAtToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :created_at, :datetime
    
  end
end
