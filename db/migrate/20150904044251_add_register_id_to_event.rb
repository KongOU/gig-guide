class AddRegisterIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :register_id, :integer
  end
end
