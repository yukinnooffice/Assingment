class UsersController < ApplicationController
  def index
    @book = Book.new
  	@user = current_user
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])

  end

  def new
  end

  def update
@user = User.find(params[:id])
if @user.update(user_params)
	redirect_to user_path(@user)
  end
end

  def create

  end

  def destroy
  end
end

  private
    def user_params
       params.require(:user).permit(:name, :introduction, :profile_image)
    end