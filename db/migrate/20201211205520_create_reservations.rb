class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.references :user, null: false, foreign_key: true
      t.references :sub_listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
