class Passenger < ApplicationRecord

  has_many :trips

  def self.total_cost
    total = 0

    Passenger.trips.each do |trip|
      total += trip.cost
    end
    return total
  end

end
