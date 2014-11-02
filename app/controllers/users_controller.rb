class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user =User.new
    # So the sign up link doesn't show when not needed
    @is_signup = true
  end  

  def create
    user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation, :agree_marketing))
    if user.save
      # the moment you sign up it logs  you in
      session[:user_id] = user.id.to_s
      redirect_to new_makeupcase_path
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation, :agree_marketing))
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    u = User.where(id:params[:id]).first
    # If person is logged in than log them out
    if u.id === current_user.id
    reset_session
    end
    # perform destroy
    u.destroy
    redirect_to new_user_path
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end