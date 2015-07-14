class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_user_story]
  before_filter :authenticate 
  # GET /projects
  # GET /projects.json
  def index
    @search = Project.search(params[:q])
    result = @search.result
    @projects = result.paginate(:page => params[:page], :per_page => 4)
    redirect_to '/users/profile', :result => result, :search => true
  end
  def add_user_story
    @user_story = UserStory.new
  end
  def update_user_story
    
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    if(!(@project.users.include? current_user || @project.creator_id == current_user.id))
      redirect_to '/home/not_found'
    end
  end
  def add_file
    @project.user_stories.first.desc_files.build
  end

  def add_task
    @project.user_stories.first.tasks.build
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    if(@project.creator_id != current_user.id)
      redirect_to '/home/not_found'
    end
  end


  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    if params[:user_id]
      @project.users << User.find(params[:user_id])
    end
    @project.users<<current_user
    @project.creator_id = current_user.id
    if params[:add_user_story]
      @project.user_stories.build.desc_files.build
      @project.user_stories.build.tasks.build
    elsif params[:add_file]
      add_file
    elsif params[:add_task]
      add_task
    else
      # save goes like usual
      if @project.save
        redirect_to @project, notice: 'Project was successfully created.' 
        return
      end
    end
    render :action => 'new'
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        @project.users = []
        @project.users << current_user

        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to "/users/profile", notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def add_user
   @users = params[:user_id]
   redirect_to @Project
 end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :user_id, user_stories_attributes: [:name, :description,desc_files_attributes:[:file],tasks_attributes:[:name]])
    end

    def authenticate
      redirect_to("/home/not_found") if current_user.nil?
    end
  end
