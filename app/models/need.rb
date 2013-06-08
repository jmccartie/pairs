class Need < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :waiver_id, :wo_status_id, :zone_id, :address_id, :affected_attributes, :waiver_attributes, :work_requested, :other_needs, :created_at, :notes

  belongs_to :zone
  belongs_to :wo_status
  belongs_to :waiver
  has_one :affected
  has_many :comments, :as => :commentable

  accepts_nested_attributes_for :affected

  acts_as_gmappable :process_geocoding => false

  def latitude
    "#{self.affected.contact.address.latitude}" if self.affected
  end

  def longitude
    "#{self.affected.contact.address.longitude}" if self.affected
  end

  def gmaps4rails_infowindow
    "<a href='#{Rails.application.routes.url_helpers.need_path(self)}'>#{self.affected.contact.address.address}</a>
    <ul class='short_descriptions'>
			<li><span>W</span> #{self.work_requested || 'none'} </li>
			<li><span>O</span> #{self.other_needs || 'none'} </li>
		</ul>"
  end
  
  def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       n = Need.new
       r = row.to_hash
       
       # Need
       n.notes = r['notes']
       n.created_at = r['date']
       n.zone = Zone.where(:zone => r['zone']).first
       n.wo_status = WoStatus.where(:status => r['status']).first
       n.work_requested = r['work_requested']
       n.other_needs = r['other_needs']
       
       # Contact (has to be a better way to do this)
       n.build_affected
       n.affected.build_contact
       n.affected.contact.build_address
       n.affected.contact.first_name = r['first_name']
       n.affected.contact.last_name = r['last_name']
       n.affected.contact.phone = r['phone']
       n.affected.contact.email = r['email']
       
       # Address
       n.affected.contact.address.address = r['Address']
       
       n.save
     end 
  end

end
