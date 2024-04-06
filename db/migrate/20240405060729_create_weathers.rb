class CreateWeathers < ActiveRecord::Migration[7.1]
  def change
    create_table :weathers do |t|
      t.integer :address_id
      t.text :description
      t.float :temperature_f
      t.float :humidity
      t.integer :visibility
      t.boolean :from_cache

      t.timestamps
    end
  end
end
