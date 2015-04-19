class CategoriesController < ApplicationController
  before_action :set_category
  before_action :set_ideas

  def edit
  end

  def update
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

end
