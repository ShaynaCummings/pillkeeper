class MedsController < ApplicationController

# before_action :verify_user!
  
 handles_sortable_columns
  
    handles_sortable_columns do |conf|
    conf.sort_param = "s"
    conf.page_param = "p"
  end
  
  def index
   @meds = Med.all
   order = sortable_column_order
   @meds = Med.order(order)   
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

  def destroy
      @med = Med.find(params[:id])
      @med.destroy
    redirect_to meds_path
    end
  def search 
  end
  
  
  private 
  
 # def verify_user!
 #   if current_user.id != params[:user_id]
  #    puts "problem!"
 #    end
 #  end

    def safe_params
      params.require(:med).permit(:med_name, :dosage, :time_of_day, :prescriber, :email, :user_id)
    end
  
end
