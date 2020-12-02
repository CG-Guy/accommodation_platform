class CreateNagationCards < ActiveRecord::Migration[6.0]

  def change
    create_table :navigation_cards do |t|

      t.timestamps
    end
  end
end
