class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Регистрация прошла успешно"
      redirect_to @user
    else
      render "new"
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update 
    if @user.update_attributes(user_params)
      flash[:success] = " Регистрация прошла успешно"
      redirect_to @user
      else
        render 'edit'
    end
  end
  
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    def signed_in_user
      redirect_to signin_url, notice: "Необходимо войти в систему" unless signed_in?
    end
  
  
end
