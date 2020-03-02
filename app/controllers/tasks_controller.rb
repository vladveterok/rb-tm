class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle]
  respond_to :html, :js

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
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to projects_path, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
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
    params.require(:task).permit(:name, :status, :position, :deadline, :project_id)
  end
end
