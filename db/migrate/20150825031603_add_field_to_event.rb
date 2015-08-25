class AddFieldToEvent < ActiveRecord::Migration
  def change
    add_column :events, :start_on, :datetime
    add_column :events, :genre, :string
  end
end
