class Ranger < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :username, presence: true
  belongs_to :park
  has_many :bears


end
