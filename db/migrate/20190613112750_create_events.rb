class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.json :location, null: false, default: {}
      t.references :author
      t.references :project
      t.timestamps
    end
    add_foreign_key :events, :users, column: :author_id, primary_key: :id
    add_foreign_key :events, :projects, column: :project_id, primary_key: :id
  end
end
