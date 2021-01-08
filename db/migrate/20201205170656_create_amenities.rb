class CreateAmenities < ActiveRecord::Migration[6.0]
  def change
    create_table :amenities do |t|
      t.string :reference
      t.string :value
      t.references :composite, polymorphic: true, null: false

      t.timestamps
    end
  end
end
