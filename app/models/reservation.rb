class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing\

  validates :start_date, :end_date, presence: true # TO-DO match availability?
  validates :status, inclusion: { in: ['Accepeted', 'Pending', 'Rejected'] }
end
