class CreateOrgs < ActiveRecord::Migration[5.2]
  def change
    create_table :orgs do |t|
      t.string :name
      t.jsonb :body, null: false, default: {}

      t.timestamps
    end
  end
end
