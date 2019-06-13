class CreateOrgProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :org_projects do |t|
      t.references :project, foreign_key: true
      t.references :org, foreign_key: true

      t.timestamps
    end
  end
end
