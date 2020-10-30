class CreateMailSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :mail_settings do |t|
      t.string :email
      t.string :address
      t.string :password
      t.string :port
      t.boolean :starttls_auto
      t.references :composite, polymorphic: true, null: false

      t.timestamps
    end
  end
end
