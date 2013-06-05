class Authentication < ActiveRecord::Base
  attr_accessible :user_id, :provider, :uid
  belongs_to :user

  validates_presence_of :user_id, :provider, :uid
end
