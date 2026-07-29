class CreateCampaigns < ActiveRecord::Migration[8.1]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.string :system, null: false, default: "LANCER"
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :campaigns, :system
  end
end
