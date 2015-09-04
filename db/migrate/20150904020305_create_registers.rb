class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :address
      t.string :email

      t.timestamps null: false
    end
  end
end
