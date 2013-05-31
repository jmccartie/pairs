class Waiver < ActiveRecord::Base
  attr_accessible :address_id, :completed
  
  belongs_to :address
end
