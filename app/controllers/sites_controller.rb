class SitesController < ApplicationController

  def index
    @sites = current_user.sites
  end

  def new
    @site = Site.new
    @user = current_user
  end


  def create
    @site = Site.new(create_site_params[:site])
    if(@site.save)
      current_user.sites << @site
      redirect_to root_path
    else
      render :new
    end
  end
# #####
  def edit
    @site = current_user.sites.find(params[:id])
    render :new
  end

  def update
    @site = current_user.sites.find(params[:id])
    @site.update(site_update_params[:site])
    redirect_to root_path
  end

  def edit_additional_info
    @site = current_user.sites.find(params[:id])
  end

  def update_additional_info
    @site = current_user.sites.find(params[:id])
    @site.update(site_additional_params[:site])
    redirect_to root_path
  end
#######

  private

  def create_site_params
    params.permit(site: [:title, :description])
  end

  def site_update_params
    params.permit(site: [:title, :description])
  end

  def site_additional_params
    params.permit(site: [:title, :description, :logo, :hero_img, :hero_title, :hero_description, :phone, :emergency, :email, :address,
      :monfri_hours, :sat_hours, :sun_hours, :testimonials_img, :facebook, :twitter, :instagram, :youtube, :skype, :pie])
  end
end
