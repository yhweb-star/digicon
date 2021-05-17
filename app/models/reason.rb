class Reason < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '遅刻' },
    { id: 3, name: '欠席' },
    { id: 4, name: '早退' }
  ]

  include ActiveHash::Associations
  has_many :absence

  end