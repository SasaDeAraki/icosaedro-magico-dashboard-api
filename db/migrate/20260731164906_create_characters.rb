class CreateCharacters < ActiveRecord::Migration[8.1]
  def change
    create_table :characters do |t|
      t.string :system, null: false
      t.string :name, null: false
      t.string :color
      t.string :flavor
      t.boolean :active, null: false, default: true

      t.references :user, null: false, foreign_key: true
      t.references :campaign, null: false, foreign_key: true

      t.string :frame_model
      t.string :frame_name
      t.string :code_name
      t.integer :total_pilot_hp
      t.integer :current_pilot_hp
      t.integer :total_structure
      t.integer :current_structure
      t.integer :total_frame_hp
      t.integer :current_frame_hp
      t.integer :total_reactor
      t.integer :current_reactor
      t.integer :heatCap
      t.integer :currentHeat

      t.integer :total_hp
      t.integer :current_hp

      t.string :resource
      t.integer :total_pe
      t.integer :current_pe
      t.integer :total_pd
      t.integer :current_pd

      t.timestamps
    end
  end
end
