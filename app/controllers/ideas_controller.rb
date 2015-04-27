class IdeasController < ApplicationController
  before_action :set_topic, except: [:show, :edit, :update]
  before_action :set_idea, except: [:index, :new, :create]


  def show
    @topic = Topic.find(@idea.topic_id)
    @category = Category.find(@topic.category_id)
  end

  def index
  end

  def new
    @idea = Idea.new
    @category = Category.find(@topic.category_id)
  end

  def create
    @idea = Idea.create(idea_params)
    @idea[:topic_id] = @topic.id

    respond_to do |format|
      if @idea.save
        format.html { redirect_to [@category, @idea], notice: 'Idea successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @topic = Topic.find(@idea.topic_id)
    @category = Category.find(@topic.category_id)
  end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path(@idea)
    else
      flash[:alert] = 'Save Failed'
      redirect_to edit_idea_path(@idea)
    end
  end

  private

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end

    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
