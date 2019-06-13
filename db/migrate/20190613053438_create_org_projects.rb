class CreateOrgProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :org_projects do |t|
      t.references :project
      t.references :org

      t.timestamps
    end
      add_foreign_key :org_projects, :projects, column: :project_id, primary_key: :id
      add_foreign_key :org_projects, :orgs, column: :org_id, primary_key: :id
  end
end
