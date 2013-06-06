class User < ActiveRecord::Base
  ROLES = ["Guest", "User", "Organizer", "Admin", "SysAdmin", "Super Admin"]

  # Relationships
  has_many :authentications, :dependent => :destroy
  has_one :contact, :as => :contactable
  has_many :comments

  attr_accessible :email, :password, :profile_image_url, :password_confirmation, :authentications_attributes, :contact_attributes
  accepts_nested_attributes_for :authentications, :contact

  # Sorcery
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  # Callbacks
  before_create :set_role

  # Validations
  validates_inclusion_of :role, in: ROLES

  # Returns boolean if related contact is complete
  def profile_complete?
    self.contact.present? && self.contact.first_name.present? && self.contact.last_name.present? && self.contact.email.present?
  end
  
  def self.roles
    ROLES
  end

  private
  def set_role
    self.role ||= "Guest"
  end

end
