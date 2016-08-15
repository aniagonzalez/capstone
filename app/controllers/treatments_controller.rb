class TreatmentsController < ApplicationController

  def index
    @treatments = Treatment.where(site_id: params[:site_id])
    @site = Site.find(params[:site_id])
  end

  def new
    @site = Site.find(params[:site_id])
    @treatment = @site.treatments.new
  end


  def create
    @site = Site.find(params[:site_id])
    @treatment = @site.treatments.new(create_treatment_params[:treatment])
    if(@treatment.save)
      redirect_to site_treatments_path
    else
      render :new
    end
  end

  def edit
    @treatment = Treatment.find(params[:id])
    @site = Site.find(params[:site_id])
    render :new
  end

  def update
    @treatment = Treatment.find(params[:id])
    @treatment.update(treatment_update_params[:treatment])
    redirect_to site_treatments_path
  end

  def destroy
    @treatment = Treatment.find(params[:id])
    # @site = Site.find(params[:site_id])
    @treatment.destroy
    redirect_to site_treatments_path
  end

  private
  def create_treatment_params
      params.permit(treatment: [:icon, :title, :description])
  end

  def treatment_update_params
      params.permit(treatment: [:icon, :title, :description])
  end

end
