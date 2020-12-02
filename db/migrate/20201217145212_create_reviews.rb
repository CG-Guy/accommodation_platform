class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :value
      t.references :user, null: false, foreign_key: true
      t.references :composite, polymorphic: true, null: false

      t.timestamps
    end
  end
end
