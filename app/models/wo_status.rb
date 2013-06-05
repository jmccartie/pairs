class WoStatus < ActiveRecord::Base
  attr_accessible :desc, :status, :style

  has_many :needs

  def to_label
    "#{status}"
  end

end
