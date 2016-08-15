class TeamMembersController < ApplicationController

  def index
    @team_members = TeamMember.where(site_id: params[:site_id])
    @site = Site.find(params[:site_id])
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
      redirect_to site_team_members_path
    else
      render :new
    end
  end

  def edit
    @team_member = TeamMember.find(params[:id])
    @site = Site.find(params[:site_id])
    render :new
  end

  def update
    @team_member = TeamMember.find(params[:id])
    @team_member.update(team_member_update_params[:team_member])
    redirect_to site_team_members_path
  end

  private
  def create_team_member_params
      params.permit(team_member: [:name, :image, :email, :phone])
  end

  def team_member_update_params
      params.permit(team_member: [:name, :image, :email, :phone])
  end

end
