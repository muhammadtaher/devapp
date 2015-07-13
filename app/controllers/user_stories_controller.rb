class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:show, :edit, :update, :destroy]

  # GET /user_stories
  # GET /user_stories.json
  def index
    @user_stories = UserStory.all
  end

  # GET /user_stories/1
  # GET /user_stories/1.json
  def show
  end
  def update_tasks
    if(params[:tasks_done])
      Task.find(params[:tasks_done]).each do |task|
        task.done = true;
        task.save
      end
    end
  end
  def add_task
    @task = Task.new
  end
  def save_task
    @user_story = UserStory.find(params[:id])
    @task = Task.new
    @task.done = false
    @task.description = params[:description]
    @user_story.tasks<<@task
    redirect_to @user_story
  end

  # GET /user_stories/new
  def new
    @user_story = UserStory.new
  end

  # GET /user_stories/1/edit
  def edit
  end

  # POST /user_stories
  # POST /user_stories.json
  def create
    @user_story = UserStory.new(user_story_params)
    key, valye = params[:id].first
    @project = Project.find(key)
    @project.user_stories << @user_story
    respond_to do |format|
      if @user_story.save
        format.html { redirect_to @user_story, notice: 'User story was successfully created.' }
        format.json { render :show, status: :created, location: @user_story }
      else
        format.html { render :new }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_stories/1
  # PATCH/PUT /user_stories/1.json
  def update
    update_tasks
    respond_to do |format|
      if @user_story.update(user_story_params)
        format.html { redirect_to @user_story, notice: 'User story was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_story }
      else
        format.html { render :edit }
        format.json { render json: @user_story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_stories/1
  # DELETE /user_stories/1.json
  def destroy
    @user_story.destroy
    respond_to do |format|
      format.html { redirect_to user_stories_url, notice: 'User story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_story
      @user_story = UserStory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_story_params
      params.require(:user_story).permit(:project_id, :name, :description, :state)
    end
end
