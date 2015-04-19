class CategoriesController < ApplicationController
  before_action :set_category
  before_action :set_ideas

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category)
    else
      flash[:warning] = 'Category failed to update.'
      redirect_to edit_category_path(@category)
    end
  end

  def show
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def set_ideas
      @ideas = @category.ideas
    end

    def category_params
      params.require(:category).permit(:title, :description)
    end

end
