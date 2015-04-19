class IdeasController < ApplicationController
  before_action :set_category
  before_action :set_idea, except: [:index, :new, :create]


  def show
  end

  def index
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to [@category, @idea], notice: 'Idea successfully created.' }
        format.json { render :show, status: :created, location: @idea}
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @idea.update(idea_params)
      redirect_to category_idea_path(@category, @idea)
    else
      flash[:alert] = 'Save Failed'
      redirect_to edit_category_idea_path(@category, @idea)
    end
  end

  private

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
