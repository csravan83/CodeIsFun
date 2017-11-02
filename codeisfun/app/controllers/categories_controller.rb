class CategoriesController < ApplicationController


  def new
    @category = Category.new(params[:name])
  end

  def show
    @categories = Category.all
  end

  def page
  end

end
