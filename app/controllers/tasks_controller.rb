class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle]
  respond_to :html, :js
  protect_from_forgery except: :sort

  def sort
    
    params[:task].each_with_index do |id, index|
      Task.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
  end

  # GET /tasks/1/edit
  def edit
  end

  def create
    @task = Task.new(task_params)
   

    unless @task.save
      head :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render "show"
    end
  end

  def toggle
    @task.toggle_completed!
  end

  def destroy
    @task.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:name, :status, :position, :deadline, :due_day, :project_id)
  end
end