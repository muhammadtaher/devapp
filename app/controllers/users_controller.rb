class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def profile
  	@search = Project.search(params[:q]);
  	result = @search.result
		@projects = Project.find(result.pluck(:id)).paginate(:page => params[:page], :per_page => 4)
	end
  

end