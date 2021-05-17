class Event < ApplicationRecord
  belongs_to :school

  with_options presence: true do
    validates :subject
    validates :start_time
    validates :ending_time
    validates :place
    validates :details
  end
end
