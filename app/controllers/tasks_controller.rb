class TasksController < ApplicationController

  def index
    @tasks = Task.all # Sees all Tasks
  end

  def new
    @task = Task.new # Create a new instance
  end

  def show # Shows one task
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params) # Creates new task instance
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
