class TasksController < ApplicationController

  def index
    @tasks = Task.all # Sees all Tasks
  end

  def new
    @task = Task.new # Create a new instance
  end

  def show # Shows one task
    @task = Task.find(params[:id]) # find specific/single task
  end

  def create
    @task = Task.new(task_params) # Creates new task instance
    if @task.save
    # when it saves -> go to the tasks show page
      redirect_to task_path(@task)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id]) # Find the task with the id.
    @task.destroy # then destroy ruby method
    redirect_to tasks_path, status: :see_other # redirects to home
  end

  private

  def task_params
    # Strong params - whitelisting the attributes users can gives us in the form.
    params.require(:task).permit(:title, :details, :completed)
  end
end
