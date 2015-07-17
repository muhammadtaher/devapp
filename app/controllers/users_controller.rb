class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def see_other
  	@user = User.find(params[:id])
  	@search = @user.projects.search(params[:q]);
  	result = @search.result    
    @projects = Project.find(result.pluck(:id)).paginate(:page => params[:page], :per_page => 4)
  end

  def profile
   	@user = current_user
  	@search = @user.projects.search(params[:q]);
  	result = @search.result
    @projects = Project.find(result.pluck(:id)).paginate(:page => params[:page], :per_page => 4)
	end
  

end