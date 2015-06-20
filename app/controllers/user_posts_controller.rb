class UserPostsController < ApplicationController
  before_action :set_user
  def index

  end
  private
  def set_user
    @user.find(params)
  end



end
