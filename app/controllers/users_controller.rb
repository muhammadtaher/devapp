class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def profile
  end
  

end