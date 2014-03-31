class TasksController < ApplicationController
  def index
    @tasks_completed = Task.completed
    @tasks = Task.not_completed
    @task = Task.new
    render('tasks/index.html.erb')
  end

  def create
    @tasks_completed = Task.completed
    @tasks = Task.not_completed
    @task = Task.new(description: params[:description])
    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/index.html.erb')
    end
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def done
    @task = Task.find(params[:id])
    @task.update(done: params[:done])
    render('tasks/done.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(description: params[:description])
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end

  def destroy
    @task = Task.find(params[:id]).destroy
    render('tasks/destroy.html.erb')
  end

end
