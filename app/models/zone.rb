class Zone < ActiveRecord::Base
  attr_accessible :desc, :zone

  has_many :needs

  def to_label
    "#{zone}"
  end
end
