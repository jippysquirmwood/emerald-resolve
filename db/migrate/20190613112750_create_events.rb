class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.jsonb :body, null: false, default: {}
      t.references :author
      t.timestamps
    end
    add_foreign_key :events, :user_org_projects, column: :author_id, primary_key: :id
  end
end
