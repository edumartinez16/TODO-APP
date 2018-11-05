# frozen_string_literal: true

# Controller for the lists in the app
class ListsController < ApplicationController
  # Filter to require that the user signs in first
  before_action :authenticate_user!
  # Filter the member actions
  before_action :set_list, only: %i[show edit update destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = current_user.lists
    respond_to do |format|
      format.html
      # Configuration for the pdf and the csv
      format.pdf { render template: 'lists/pdf', pdf: 'pdf'}
      format.csv { send_data @lists.to_csv, filename: "csv-#{Date.today}.csv" }
    end
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
    @tasks = @list.tasks
    # Setting a layout different from the default
    render layout: 'application'
  end

  # GET /lists/new
  def new
    @list = List.new
    # Setting a layout different from the default
    render layout: 'application'
  end

  # GET /lists/1/edit
  def edit
    # Setting a layout different from the default
    render layout: 'application'
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'The List was updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'The List was destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  # Never trust parameters from the scary internet.
  def list_params
    params.require(:list).permit(:name).merge(user_id: current_user.id)
  end
end
