class AddEventIdToRegister < ActiveRecord::Migration
  def change
    add_reference :registers, :event, index: true, foreign_key: true
  end
end
