class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end
  def create
    @user = User.new(user_params)
  end


private
    def set_user
      @post = user.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
