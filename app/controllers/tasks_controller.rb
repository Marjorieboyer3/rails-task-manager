class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    #conseil : mettre raise pour voir les params #(3)
    @task = Task.new(task_params)
    #récupérer les params
    @task.save!
    #sauvegarder le nouveau resto vers la base de données #! permet de voir l'erreur
    redirect_to '/tasks'
    #rediriger vers la page d'acceuille
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
