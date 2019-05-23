class Robot < ApplicationRecord
  has_one :ability
  validates :name, presence: true, uniqueness: true
  #validates :ability, presence: true
end
