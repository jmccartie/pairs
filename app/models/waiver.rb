class Waiver < ActiveRecord::Base
  attr_accessible :contact_attributes, :special_instructions, :signature

  validates_presence_of :signature

  has_one :need

  has_one :contact, :as => :contactable
  accepts_nested_attributes_for :contact

end
