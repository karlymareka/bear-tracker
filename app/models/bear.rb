class Bear < ActiveRecord::Base
  validates :name, presence: true
  validates :species, presence: true
  validates :sex, presence: true
  validates :health_status, presence: true
  validates :habituation_status, presence: true
  validates :ranger_id, presence: true

  belongs_to :ranger
  belongs_to :park


end
