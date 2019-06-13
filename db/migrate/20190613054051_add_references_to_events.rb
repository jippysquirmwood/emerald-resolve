class AddReferencesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :author
    add_reference :events, :project
    add_foreign_key :events, :users, column: :author_id, primary_key: :id
    add_foreign_key :events, :projects, column: :project_id, primary_key: :id
  end
end
