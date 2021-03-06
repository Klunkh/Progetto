class UsersController < ApplicationController


  def index
	@user=User.all
end
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])

  end

  def new
    @user = User.new
  end
 def create
    @user = User.new(user_params)
    if @user.save
	log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
