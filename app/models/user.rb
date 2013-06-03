class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :authentications_attributes, :contact_attributes
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  before_create :set_role

  has_many :authentications, :dependent => :destroy
  has_one :contact, :as => :contactable
  
  belongs_to :role
  
  accepts_nested_attributes_for :authentications, :contact
  
  def profile_complete?
    self.contact.present? && self.contact.first_name.present? && self.contact.last_name.present? && self.contact.email.present?
  end
  
  private
  def set_role
    self.role ||= Role.where(:title => "Guest").first
  end
  
end
