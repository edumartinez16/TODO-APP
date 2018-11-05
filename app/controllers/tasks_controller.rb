# frozen_string_literal: true

# Controller for the tasks in the app
class TasksController < ApplicationController
  # Filter to require that the user signs in first
  before_action :authenticate_user!
  # Filter the member actions
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    # Setting a layout different from the default
    render layout: 'application'
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    # Setting a layout different from the default
    render layout: 'application'
  end

  # GET /tasks/new
  def new
    @task = Task.new
    # Setting a layout different from the default
    render layout: 'application'
  end

  # GET /tasks/1/edit
  def edit
    # hey
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @lists = current_user.lists.all
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'The Task was created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'The Task was updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to lists_path, notice: 'The Task was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet.
  def task_params
    params.require(:task).permit(:description, :limit, :list_id)
  end
end
