class CommentsController < ApplicationController
  before_action :set_user
  before_action :find_problem
  before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
  before_action :comment_owner, only: [:destroy, :edit, :update]
  load_and_authorize_resource

  def index
    @comment = Comment.all
  end

  def new
    # @comment = Comment.new(problem_id: params[:problem_id])
  end

  def create
    @comment = @problem.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      flash[:success] = "Comment successfully created"
      redirect_to @problem
    else
      flash[:danger] = "error"
      # render 'new'
    end
  end

  def edit

  end

  def update
    if @comment.update(comment_params)
      flash[:success] = "Comment successfully edited"
      redirect_to @problem
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment successfully destroy"
    redirect_to @problem
  end

  def find_problem
    begin
      @problem = Problem.find(params[:problem_id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Don't have this question!"
      redirect_to @problem
    end
  end

  def find_comment
    begin
      @comment = @problem.comments.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Don't have this comment!"
      redirect_to @problem
    end
  end

  def comment_owner
    unless current_user.id == @comment.user_id || current_user.admin?
      flash[:error] = "You don't have authorization!"
      redirect_to @problem
    end
  end


  def show
    @comment = Comment.find(params[:id])
  end

  private

  def set_user
    @user = current_user
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
