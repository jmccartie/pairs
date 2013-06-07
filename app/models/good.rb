class Good < ActiveRecord::Base
  STATUSES = ['Need More', 'Have Enough', 'Too Much']
  CATEGORIES = ["Food and Water", "Tools", "Power Equipment", "Clothing", "Household Items", "Personal Care Items", "Other"]
  
  attr_accessible :category, :desc, :drop_off, :pick_up, :pod_id, :status, :title
  belongs_to :pod
  
  # Validations
  validates_inclusion_of :status, in: STATUSES
  validates_inclusion_of :category, in: CATEGORIES
  
  def self.statuses
    STATUSES
  end
  
  def self.categories
    CATEGORIES
  end
end
