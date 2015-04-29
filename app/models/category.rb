class Category < ActiveRecord::Base
  has_many :topics, dependent: :destroy
  has_many :ideas, through: :topics, dependent: :destroy
end
