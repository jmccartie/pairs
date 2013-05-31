class Contact < ActiveRecord::Base
  attr_accessible :contactable_id, :contactable_type, :email, :first_name, :last_name, :phone, :address_id, :address_attributes
  
  belongs_to :contact, :polymorphic => true
  belongs_to :address
  accepts_nested_attributes_for :address
end
