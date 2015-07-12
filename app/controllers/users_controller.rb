class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def profile
  end
  def test
  	render profile
  end

end