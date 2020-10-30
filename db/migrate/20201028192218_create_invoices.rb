class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.boolean :paid
      t.timestamp :due_date
      t.string :payment_type
      t.float :tax
      t.references :user, null: false, foreign_key: true
      t.references :composite, polymorphic: true, null: false

      t.timestamps
    end
  end
end
