class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.text :street_address
      t.text :city
      t.text :state
      t.text :zip
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
