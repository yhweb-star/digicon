class Room < ApplicationRecord
  belongs_to :school
  belongs_to :user
  has_many :messages
end
