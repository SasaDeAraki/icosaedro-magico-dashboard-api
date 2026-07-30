class CreateJoinTableCampaingUser < ActiveRecord::Migration[8.1]
  def change
    create_join_table :campaigns, :users do |t|
      t.index [ :campaign_id, :user_id ]
      t.index [ :user_id, :campaign_id ]
    end
  end
end
