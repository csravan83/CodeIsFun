class SolutionsController < ApplicationController
  before_action :set_user
  before_action :find_problem
  before_action :set_solution, only: [:show, :edit, :update, :destroy]

  # GET /solutions
  # GET /solutions.json
  def index
    @solutions = Solution.all
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
    @solution = Solution.find(params[:id])
    send_data(@solution.file_contents,
              type: @solution.content_type,
              filename: @solution.filename)
  end

  # GET /solutions/new
  def new
    @solution = Solution.new(id: params[:problem_id])
  end

  # GET /solutions/1/edit
  def edit
  end

  # POST /solutions
  # POST /solutions.json
  def create

    @solution = @problem.solutions.create(solution_params)
    @solution.user_id = current_user.id
    respond_to do |format|
      if @solution.save
        format.html { redirect_to @problem, notice: 'Solution was successfully Submitted.' }
        format.json { render :show, status: :created, location: @solution }
      else
        format.html { render :new }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to @solution, notice: 'Solution was successfully updated.' }
        format.json { render :show, status: :ok, location: @solution }
      else
        format.html { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to solutions_url, notice: 'Solution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

  def set_user
    @user = current_user
  end

  def find_problem
    @problem = Problem.find(params[:problem_id])
  end

  def find_comment
    @solution = @problem.solutions.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:filename, :content_type, :file_contents, :user_id, :problem_id, :file)
    end
end
