class Bear < ActiveRecord::Base
  belongs_to :ranger
  belongs_to :park 


end
