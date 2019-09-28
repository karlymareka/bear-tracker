class Park < ActiveRecord::Base
  has_many :rangers
  has_many :bears

end
