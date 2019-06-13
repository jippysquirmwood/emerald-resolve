class CreateUserOrgProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_org_projects do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, foreign_key: true
      t.references :org_project, foreign_key: true

      t.timestamps
    end
  end
end
