class Waiver < ActiveRecord::Base
  attr_accessible :contact_attributes, :special_instructions
  
  has_one :work_order
  
  has_one :contact, :as => :contactable
  accepts_nested_attributes_for :contact
  
end
