class CreateUserOrgProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_org_projects do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user
      t.references :org_project

      t.timestamps
    end
    add_foreign_key :user_org_projects, :users, column: :user_id, primary_key: :id
    add_foreign_key :user_org_projects, :org_projects, column: :org_project_id, primary_key: :id
  end
end
