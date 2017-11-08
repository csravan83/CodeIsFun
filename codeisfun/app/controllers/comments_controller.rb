class CommentsController < ApplicationController
  before_action :set_user
  #before_action :set_problem

  def create
    @comment = @problem.comment.create(comment_params)
   # @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to problems_path
    else
      flash[:danger] = "error"
    end

  end

  def show
    @comments = Comment.all
  end

  private

  def set_user
    @user = current_user
  end

=begin
  def set_problem
    @problem = Problem.find(params[:id])
  end
=end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
