class MedsController < ApplicationController

  before_action :authenticate_user!
  
 # handles_sortable_columns
  
  def index
   @meds = Med.all
  # order = sortable_column_order
  # @meds = Med.order(order)   
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
     @save
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
  
  def destroy
    redirect_to action: "index"
  end

  def search
    
  end
  
  
  private 
  
    def safe_params
      params.require(:med, :med_name).permit(:med_name, :dosage, :time_of_day, :prescriber, :email)
    end
  
end
