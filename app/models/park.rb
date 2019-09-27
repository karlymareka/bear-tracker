class Park < ActiveRecord::Base
  has_many :rangers
  has_many :bears
  # has_many :bears, through: :rangers

end
