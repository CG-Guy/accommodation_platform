class CreateBlobValidators < ActiveRecord::Migration[6.0]
  def change
    create_table :blob_validators do |t|

      t.timestamps
    end
  end
end
