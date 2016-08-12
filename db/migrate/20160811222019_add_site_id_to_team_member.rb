class AddSiteIdToTeamMember < ActiveRecord::Migration
  def change
    add_column :team_members, :site_id, :integer
    add_index :team_members, :site_id
  end
end
