class AddTopicReferencesToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :topic, index: true
    add_foreign_key :ideas, :topics
  end
end
