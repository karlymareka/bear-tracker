class Ranger < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :username, presence: true
  validates_uniqueness_of :username

  belongs_to :park
  has_many :bears


end
