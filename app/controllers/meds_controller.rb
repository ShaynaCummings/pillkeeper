class MedsController < ApplicationController

  before_action :authenticate_user!
  
  def index
   @meds = Med.all
  end
  
  def show
    params
    @med = Med.find(params[:id])
  end
  
  def new
    @med = Med.new
  end
  
  def edit
    @med = Med.find(params[:id])
  end
  
  def create
    @med = Med.new(safe_params)

    if @med.save
      redirect_to @med
    else
      render :new      
    end
  end
    
   def update 
     @med = Med.find(params[:id])
     if @med.update(safe_params)
       redirect_to @med
    else 
      render :edit
    end
   end
  
  def delete
    @med = Med.find(params[:id])
    @med.destroy
    redirect_to med_path
  end

  
  private 
  
    def safe_params
      params.require(:med).permit(:med_name)
    end
  
end
