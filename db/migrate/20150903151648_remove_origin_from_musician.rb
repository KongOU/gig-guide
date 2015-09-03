class RemoveOriginFromMusician < ActiveRecord::Migration
  def change
    remove_column :musicians, :origin, :string
  end
end
