class UsersController < ApplicationController
  
  before_action :authenticate_user!, :redirect_if_not_correct_user!, except: :update
  
  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(safe_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  
   def safe_params
     params.require(:user).permit(:email, :first_name, :last_name)
   end
   
  def redirect_if_not_correct_user!
    redirect_to root_path unless correct_user?
  end
  
  def correct_user?
    current_user.id == params[:id].to_i
  end
  
end
