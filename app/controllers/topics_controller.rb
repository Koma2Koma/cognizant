class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy, :edit, :update]
  before_action :set_category, only: [:destroy, :new, :create]
  before_action :set_ideas, only: [:show, :edit]
  
  def new
    @topic = Topic.new(category_id: params[:category_id])
  end

  def create
    @topic = Topic.create(topic_params)
    @topic[:category_id] = @category.id
    
    respond_to do |format|
      if @topic.save
        format.html { redirect_to [@topic], notice: 'Topic successfully created.' }
        format.json { render :show, status: :created, location: @topic}
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find(@topic.category_id)
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_path(@topic)
    else
      flash[:alert] = 'Save Failed'
      redirect_to edit_topic_path(@topic)
    end
  end

  def show
    @category = Category.find(@topic.category_id)
  end

  def index
  end

  def destroy
  end

  private

    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def set_ideas
      @ideas = Idea.where(topic_id: params[:id])
    end

    def topic_params
      params.require(:topic).permit(:title, :description, :category_id)
    end
end
