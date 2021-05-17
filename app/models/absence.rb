class Absence < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :reason

  with_options presence: true do
    validates :date_when
    validates :status
  end

  validates :reason_id, numericality: { other_than: 1 } 

end
