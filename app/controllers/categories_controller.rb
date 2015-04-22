class CategoriesController < ApplicationController
  before_action :set_category, except: [:new, :create, :index]
  before_action :set_topics, except: [:update, :new, :create, :index]
  before_action :set_ideas, except: [:new, :create, :index]

  def index
    @categories = Category.all
  end

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

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
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

    def set_topics
      @topics = @category.topics
    end

    def category_params
      params.require(:category).permit(:title, :description)
    end

end
