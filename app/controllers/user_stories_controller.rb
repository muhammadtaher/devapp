class UserStoriesController < ApplicationController
  before_action :set_user_story, only: [:update_state, :show, :edit, :update, :destroy, :set_completed]
  # GET /user_stories
  # GET /user_stories.json
  def index
    @user_stories = UserStory.all
  end

  def set_completed
  end


  def get_file
    @user_story = UserStory.find(params[:id])
    send_file '/assets/data/'<<DescFile.find(params[:file_id]).file.original_filename, :type=>"image/*", :x_sendfile=>true
    redirect_to @user_story
  end

  def add_comment
    @user_story = UserStory.find(params[:id])
    comment = Comment.create
    comment.title = params[:title]
    comment.comment = params[:comment]
    @user_story.comments << comment    
    respond_to do |format|
      format.html { redirect_to @user_story}
      format.js 
    end
    
  end
  # GET /user_stories/1
  # GET /user_stories/1.json
  def show
  end

  def update_tasks
    @user_story.tasks.each do |task|
      task.done = false
      task.save
    end
    if(params[:tasks_done])
      Task.find(params[:tasks_done]).each do |task|
        task.done = true;
        task.save
      end
    end
  end
  def update_state 
    @user_story.state = params[:state]
    @user_story.save
     respond_to do |format|
        format.html { redirect_to @user_story, notice: 'User story was successfully created.' }
        format.js
      end

  end
  def add_task
    @task = Task.new
  end

  def add_file
    @desc_file = DescFile.new
  end
  def save_task
    @user_story = UserStory.find(params[:id])
    @task = Task.new
    @task.done = false
    @task.description = params[:description]
    @user_story.tasks<<@task
    redirect_to @user_story
  end

  def save_file
    @user_story = UserStory.find(params[:id])
    @desc_file = DescFile.new
    @desc_file.file = params[:file]
    @user_story.desc_files<<@desc_file
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
        format.js
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
