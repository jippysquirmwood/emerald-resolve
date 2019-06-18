class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.jsonb :body, null: false, default: {}

      t.timestamps
    end
  end
end
