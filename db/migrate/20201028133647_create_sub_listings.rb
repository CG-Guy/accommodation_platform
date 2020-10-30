class CreateSubListings < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_listings do |t|
      t.string :status
      t.float :price
      t.integer :no_rooms
      t.integer :no_guests

      t.timestamps
    end
  end
end
