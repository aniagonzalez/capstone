class GalleryPicturesController < ApplicationController
  def index
    @gallery_pictures = GalleryPicture.where(site_id: params[:site_id])
    @site = Site.find(params[:site_id])
  end

  def new
    @site = Site.find(params[:site_id])
    @gallery_picture = @site.gallery_pictures.new
    # @user = current_user
  end


  def create
    @site = Site.find(params[:site_id])
    @gallery_picture = @site.gallery_pictures.new(create_gallery_picture_params[:gallery_picture])
    if(@gallery_picture.save)
      redirect_to site_gallery_pictures_path
    else
      render :new
    end
  end

  def edit
    @gallery_picture = GalleryPicture.find(params[:id])
    @site = Site.find(params[:site_id])
    render :new
  end

  def update
    @gallery_picture = GalleryPicture.find(params[:id])
    @gallery_picture.update(gallery_picture_update_params[:gallery_picture])
    redirect_to site_gallery_pictures_path
  end

  def destroy
    @gallery_picture = GalleryPicture.find(params[:id])
    # @site = Site.find(params[:site_id])
    @gallery_picture.destroy
    redirect_to site_gallery_pictures_path
  end

  private
  def create_gallery_picture_params
      params.permit(gallery_picture: [:image_thumb, :image_large, :image_alt])
  end

  def gallery_picture_update_params
      params.permit(gallery_picture: [:image_thumb, :image_large, :image_alt])
  end
end
