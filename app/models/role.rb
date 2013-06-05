class Role < ActiveRecord::Base
  attr_accessible :desc, :title

  def to_label
    title
  end

end
