class MedsController < ApplicationController

 # before_action :verify_user!
  
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
     if @med.update(safe_params)
       redirect_to @med
    else 
      render :edit
    end
   end
  
  def delete
    @med = Med.find(params[:id])
   # if @med.present?
      @med.delete
   # else
   #   redirect_to user_path
   # end
  end
  
  def destroy
    redirect_to user_path
  end

  def search 
  end
  
  
  private 
  
  def verify_user!
     if current_user.id != params[:id]
       redirect_to user_root_path
       
     end
  end

    def safe_params
      params.require(:med).permit(:med_name, :dosage, :time_of_day, :prescriber, :email, :user_id)
    end
  
end
