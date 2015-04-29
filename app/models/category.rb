class Category < ActiveRecord::Base
  has_many :topics, dependend: :destroy
  has_many :ideas, through: :topics, dependent: :destroy
end
