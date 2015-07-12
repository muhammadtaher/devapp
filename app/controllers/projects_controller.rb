class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate 

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    if(!(@project.users.include? current_user || @project.creator_id == current_user.id))
      redirect_to '/home/not_found'
    end
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
    @project.users << User.find(params[:user_id])
    @project.users<<current_user
    @project.creator_id = current_user.id
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.'<<@project.creator_id.to_s<<"SS" }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        @project.users = []
        @project.users << current_user
        @project.users<<User.find(params[:user_id])
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
      params.require(:project).permit(:name, :description, :user_id)
    end

    def authenticate
        redirect_to("/home/not_found") if current_user.nil?
    end
end
