class Affected < ActiveRecord::Base
  attr_accessible :contact_attributes
  
  has_one :contact, :as => :contactable
  accepts_nested_attributes_for :contact
  
end
