class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :destroy]
  before_action :set_category, only: [:destroy, :new, :create]
  
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
  end

  def show
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

    def topic_params
      params.require(:topic).permit(:title, :description, :category_id)
    end
end
