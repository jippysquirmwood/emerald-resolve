class CreateOrgProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :org_projects do |t|
      t.references :project_id, foreign_key: true
      t.references :org_id, foreign_key: true

      t.timestamps
    end
  end
end
