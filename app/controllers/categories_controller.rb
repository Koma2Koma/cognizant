class CategoriesController < ApplicationController
  def edit
  end

  def update
  end

  def show
    @category = Category.find(params[:id])
    @ideas = @category.ideas
  end
end
