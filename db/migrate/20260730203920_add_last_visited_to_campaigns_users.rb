class AddLastVisitedToCampaignsUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :campaigns_users, :last_visited, :datetime
  end
end
