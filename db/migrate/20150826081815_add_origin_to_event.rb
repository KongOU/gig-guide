class AddOriginToEvent < ActiveRecord::Migration
  def change
    add_column :events, :origin_id, :integer
  end
end
