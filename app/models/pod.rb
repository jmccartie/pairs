class Pod < ActiveRecord::Base
  attr_accessible :desc, :notice, :properties, :title, :address_id, :address_attributes, :contact_attributes, :properties, :hours_of_operation, :length_of_operation, :storage_capacity, :percent_full, :notes
  serialize :properties, ActiveRecord::Coders::Hstore
  hstore_accessor :properties, :hours_of_operation, :length_of_operation, :storage_capacity, :percent_full
  
  delegate :latitude, to: :address
  delegate :longitude, to: :address

  belongs_to :contact, :polymorphic => true
  belongs_to :address
  accepts_nested_attributes_for :address

  acts_as_gmappable :process_geocoding => false

  def gmaps4rails_address
   "#{self.latitude}, #{self.longitude}"
  end
  
  def self.import(file)
     CSV.foreach(file.path, headers: true) do |row|
       p = Pod.new
       r = row.to_hash 
       p.title = r['Organization'] 
       p.desc = r['Affiliated/Sponsoring Agencies']
       p.contact = Contact.new
       p.contact.first_name = r['POC Name'].to_s.split(' ').first
       p.contact.last_name = r['POC Name'].to_s.split(' ').last
       p.contact.phone = r['Contact Number']
       p.build_address
       p.address.address = "#{r['Address']}, #{r['City']}, #{r['State']}, #{r['Zip Code']}" 
       p.hours_of_operation = r['Daily Hours of Operation'] 
       p.length_of_operation = r['Anticipated Length of Operation'] 
       p.storage_capacity = r['Size of Donations Housing Area'] 
       p.percent_full = r['Percent Full'] 
       p.notes = r['Notes']
       p.save
     end 
  end
  
end
