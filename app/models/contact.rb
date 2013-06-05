class Contact < ActiveRecord::Base
  attr_accessible :contactable_id, :contactable_type, :email, :first_name, :last_name, :phone, :address_id, :address_attributes

  delegate :latitude, to: :address
  delegate :longitude, to: :address

  belongs_to :contact, :polymorphic => true
  belongs_to :address
  accepts_nested_attributes_for :address

  acts_as_gmappable :process_geocoding => false

  def gmaps4rails_address
   "#{self.latitude}, #{self.longitude}"
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
