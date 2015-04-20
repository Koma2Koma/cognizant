class Category < ActiveRecord::Base
  has_many :topics
  has_many :ideas, through: :topic
end
