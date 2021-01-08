class CreateInformationBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :information_blocks do |t|
      t.string :title
      t.text :description
      t.references :composite, polymorphic: true, null: false

      t.timestamps
    end
  end
end
