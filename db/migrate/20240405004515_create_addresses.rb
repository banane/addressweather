class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.text :street
      t.text :city
      t.text :zip
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
