class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :commentable, :polymorphic => true
  belongs_to :user

  validates_numericality_of :user_id, :commentable_id
end
