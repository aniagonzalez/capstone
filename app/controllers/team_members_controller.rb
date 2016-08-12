class TeamMembersController < ApplicationController

  def index
    @team_members = TeamMember.where(site_id: params[:site_id])
  end

  def new
    @site = Site.find(params[:site_id])
    @team_member = @site.team_members.new
    # @user = current_user
  end


  def create
    @site = Site.find(params[:site_id])
    @team_member = @site.team_members.new(create_team_member_params[:team_member])
    if(@team_member.save)
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def create_team_member_params
      params.permit(team_member: [:name, :image, :email, :phone])
  end

end
