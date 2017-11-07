class CommentsController < ApplicationController
  before_action :set_user
  #before_action :set_problem

  def create
    @comment = @problem.comments.create(comment_params)

    if @comment.save
      redirect_to @problem
    end
  end

  def show
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
    params.require(:comment).permit!
  end
end
