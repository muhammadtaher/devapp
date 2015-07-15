class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def profile
  	@search = Project.search(params[:q]);
  	result = @search.result
  	result = result.find(current_user.projects)
	@projects = Project.find(result).paginate(:page => params[:page], :per_page => 4)
	end
  

end