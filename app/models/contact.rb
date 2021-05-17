class Contact < ApplicationRecord
  belongs_to :school

  with_options presence: true do
    validates :subject
    validates :contents
  end
end
