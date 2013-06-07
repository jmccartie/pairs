class Pod < ActiveRecord::Base
  attr_accessible :desc, :notice, :properties, :title, :address_id, :address_attributes, :properties, :hours_of_operation, :length_of_operation, :storage_capacity, :percent_full
  serialize :properties, ActiveRecord::Coders::Hstore
  hstore_accessor :properties, :hours_of_operation, :length_of_operation, :storage_capacity, :percent_full
  
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
