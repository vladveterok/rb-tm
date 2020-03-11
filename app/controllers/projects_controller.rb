class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html, :js

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects.order(created_at: :desc).all
    @new_project = Project.new
    @new_task = Task.new
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @new_task = Task.new

    unless @project.save
      head :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @new_task = Task.new
    if @project.update(project_params)
      render "show"
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
  end

  def count_projects
    # get and sort projects by number of tasks
    @projects_by_tasks_desc = Project.order(tasks_count: :desc).all

    # get and sort projects by name
    @projects_by_name = Project.order(:name).all

    # get projects with name starts with "/^[nN]/"
    @projects_by_n = Project.where("name ~ ?", '^[nN]' )

    # get all tasks with duplicate name
    @tasks_duplicate_names = Task.order(:name).where(name: Task.select(:name).group(:name).having("count(*) > 1"))
    #Task.order(:name).select(:name).group(:name).having("count(*) > 1")

    # get all tasks with multiple matches ordered by number of matches
    @arr = []
    project = Project.find_by(name: 'Garage')
    if project
      tasks_duplicate_in_garage = project.tasks.select(:completed, :name).group(:completed,
        :name).having("count(*) > 1").size
      @arr = tasks_duplicate_in_garage.sort_by{|r,v|v}.reverse
    else
      @arr
    end
    
    # get projects with "a" in the middle
    @projects_with_a = []
    @projects_by_tasks_desc.each do |project|
        @middle = ''
      if project.name.length.even?
        @middle = project.name[project.name.length/2-1] + project.name[project.name.length/2]
      else
        @middle = project.name[project.name.length/2]
      end

      if @middle.include?("a")
        @projects_with_a << project
      end
    end

    # get projects with more than 10 completed tasks
    @projects_by_project_id = Project.order(:id).all
    @projects_with_completed = []

    @projects_by_project_id.each do |project|
      if project.tasks.completed.count > 10
        @projects_with_completed << project
      end
    end
   
    
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :user_id)
    end
end
