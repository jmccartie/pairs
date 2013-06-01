class WorkOrder < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :waiver_id, :wo_status_id, :zone_id, :address_id, :affected_attributes, :waiver_attributes
  
  belongs_to :zone
  belongs_to :wo_status
  has_one :waiver
  has_one :affected
  accepts_nested_attributes_for :affected
  
  acts_as_gmappable :process_geocoding => false
  
  def latitude
    "#{self.affected.contact.address.latitude}"
  end
  
  def longitude
    "#{self.affected.contact.address.longitude}"
  end
  
  def gmaps4rails_infowindow
    "#{self.affected.contact.address.address}"
  end
  
end
