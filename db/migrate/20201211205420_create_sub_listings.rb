class CreateSubListings < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_listings do |t|
      t.string :status
      t.string :price
      t.string :no_rooms
      t.string :no_adults
      t.string :no_children
      t.string :title
      t.references :composite, polymorphic: true, null: false

      t.timestamps
    end
  end
end
