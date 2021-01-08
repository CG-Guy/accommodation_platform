class CreateAmenityItems < ActiveRecord::Migration[6.0]
  def change
    create_table :amenity_items do |t|
      t.string :value
      t.string :key
      t.string :icon

      t.timestamps
    end
  end
end
