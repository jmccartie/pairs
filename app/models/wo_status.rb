class WoStatus < ActiveRecord::Base
  attr_accessible :desc, :status
  
  has_many :work_orders
  
  def to_label
    "#{status}"
  end
end
