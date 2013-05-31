class Zone < ActiveRecord::Base
  attr_accessible :desc, :zone
  
  has_many :work_orders
  
  def to_label
    "#{zone}"
  end
end
