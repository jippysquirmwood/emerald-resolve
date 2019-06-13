class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.json :location, null: false, default: {}
      t.timestamps
    end
  end
end
