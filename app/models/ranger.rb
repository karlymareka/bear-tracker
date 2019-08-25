class Ranger < ActiveRecord::Base
  has_secure_password 
  belongs_to :park


end
