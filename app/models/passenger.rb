class Passenger < ApplicationRecord

  has_many :trips

  validates :name, presence: true

  validates :phone_num, presence: true

  def total_cost
    total = 0

    trips.each do |trip|
      if trip.cost
        total += trip.cost
      end
    end
    return total
  end

end
