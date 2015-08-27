class AddOriginToMusician < ActiveRecord::Migration
  def change
    add_reference :musicians, :origin, index: true, foreign_key: true
  end
end
