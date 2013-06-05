class Need < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :waiver_id, :wo_status_id, :zone_id, :address_id, :affected_attributes, :waiver_attributes, :work_requested, :other_needs

  belongs_to :zone
  belongs_to :wo_status
  belongs_to :waiver
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
    "<a href='#{Rails.application.routes.url_helpers.need_path(self)}'>#{self.affected.contact.address.address}</a>"
  end

end
