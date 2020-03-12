# SQL Tasks

## get and sort projects by number of tasks:
    @projects_by_tasks_desc = Project.order(tasks_count: :desc).all

## get and sort projects by name:
    @projects_by_name = Project.order(:name).all

## get projects with name starts with "/^[nN]/":
    @projects_by_n = Project.where("name ~ ?", '^[nN]' )

## get all tasks with duplicate name:
    @tasks_duplicate_names = Task.order(:name).where(name: Task.select(:name).group(:name).having("count(*) > 1"))
    #Task.order(:name).select(:name).group(:name).having("count(*) > 1")

## get all tasks with multiple matches ordered by number of matches:
    @arr = []
    project = Project.find_by(name: 'Garage')
    if project
      tasks_duplicate_in_garage = project.tasks.select(:completed, :name).group(:completed,
        :name).having("count(*) > 1").size
      @arr = tasks_duplicate_in_garage.sort_by{|r,v|v}.reverse
    else
      @arr
    end
    
## get projects with "a" in the middle:
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

## get projects with more than 10 completed tasks:
    @projects_by_project_id = Project.order(:id).all
    @projects_with_completed = []

    @projects_by_project_id.each do |project|
      if project.tasks.completed.count > 10
        @projects_with_completed << project
      end
    end