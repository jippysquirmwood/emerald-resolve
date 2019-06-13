class CreateOrgs < ActiveRecord::Migration[5.2]
  def change
    create_table :orgs do |t|
      t.string :name
      t.json :org_data, null: false, default: '{}'

      t.timestamps
    end
  end
end
