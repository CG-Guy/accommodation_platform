class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street_name
      t.string :province
      t.string :city
      t.string :zip_code
      t.string :street_address
      t.string :country
      t.references :composite, polymorphic: true, null: false

      t.timestamps
    end
  end
end
