class Pod < ActiveRecord::Base
  attr_accessible :desc, :notice, :properties, :title
  
  delegate :latitude, to: :address
  delegate :longitude, to: :address

  belongs_to :point_of_contact, :polymorphic => true
  belongs_to :address
  accepts_nested_attributes_for :address

  acts_as_gmappable :process_geocoding => false

  def gmaps4rails_address
   "#{self.latitude}, #{self.longitude}"
  end
  
end
