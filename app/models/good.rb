class Good < ActiveRecord::Base
  STATUSES = ['Need More', 'Have Enough', 'Too Much']
  
  attr_accessible :category, :desc, :drop_off, :pick_up, :pod_id, :status, :title
  
  # Validations
  validates_inclusion_of :status, in: STATUSES
  
  def self.statuses
    STATUSES
  end
end
