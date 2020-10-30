class CreateSiteAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :site_admins do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
