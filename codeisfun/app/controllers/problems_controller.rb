class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  # GET /problems
  # GET /problems.json
  def page
  end

  def index
    if params[:catid].blank?
      @problems = Problem.all
    else
      @problems = Problem.where(category_id: params[:catid])
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @comments = Comment.where(problem_id: @problem).order("created_at DESC")
    # @comments = @problem.comments.all
    # @comment = @problem.comments.build
  end

  # GET /problems/new
  def new
    @problem = Problem.new
    @comment = Comment.new(problem_id: params[:problem_id])
  end

  # GET /problems/1/edit
  def edit
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(problem_params)

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_problem
      @problem = Problem.find(params[:id])
    end


    def problem_params
      params.require(:problem).permit( :title, :description, :input, :output, :TC1, :TC2, :TC3, :status, :author, :category_id)
    end
end
