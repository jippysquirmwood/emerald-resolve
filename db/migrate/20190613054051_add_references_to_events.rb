class AddReferencesToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :author, :references
    add_column :events, :project, :references
  end
end
