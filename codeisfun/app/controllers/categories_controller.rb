class CategoriesController < ApplicationController
  before_action :find_category, only: [:destroy, :edit, :update, :category_owner]
  before_action :category_owner, only: [:create, :new]


  def new
    @category = Category.new
  end

  def show
    @categories = Category.all
  end

  def index
    @categories = Category.all
  end

  def edit

  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_show_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Comment successfully edited"
      redirect_to categories_show_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Comment successfully destroy"
    redirect_to categories_show_path
  end

  def find_category
    begin
      @category = Category.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      flash[:error] = "Don't have this comment!"
      redirect_to categories_show_path
    end
  end

  def category_owner
    unless current_user.admin?
      flash[:error] = "You don't have authorization!"
      redirect_to categories_show_path
    end
  end

  def category_params
    params.require(:category).permit!
  end

end
