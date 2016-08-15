class TestimonialsController < ApplicationController

    def index
      @testimonials = Testimonial.where(site_id: params[:site_id])
      @site = Site.find(params[:site_id])
    end

    def new
      @site = Site.find(params[:site_id])
      @testimonial = @site.testimonials.new
    end


    def create
      @site = Site.find(params[:site_id])
      @testimonial = @site.testimonials.new(create_testimonial_params[:testimonial])
      if(@testimonial.save)
        redirect_to site_testimonials_path
      else
        render :new
      end
    end

    def edit
      @testimonial = Testimonial.find(params[:id])
      @site = Site.find(params[:site_id])
      render :new
    end

    def update
      @testimonial = Testimonial.find(params[:id])
      @testimonial.update(testimonial_update_params[:testimonial])
      redirect_to site_testimonials_path
    end

    def destroy
      @testimonial = Testimonial.find(params[:id])
      # @site = Site.find(params[:site_id])
      @testimonial.destroy
      redirect_to site_testimonials_path
    end

    private
    def create_testimonial_params
        params.permit(testimonial: [:name, :description, :title])
    end

    def testimonial_update_params
        params.permit(testimonial: [:name, :description, :title])
    end
end
