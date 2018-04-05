class Driver < ApplicationRecord
  has_many :trips

  validates :vin, presence: true

  FEE = 1.65
  DRIVER_SHARE = 0.8

  def total_revenue

    subtotal = 0
    trips.each do |trip|
      subtotal += trip.cost - FEE
    end

    total = subtotal * DRIVER_SHARE
    return total.to_f.round(2)
  end

  def average_rating

    total_ratings = 0
    self.trips.each do |trip|
      total_ratings += trip.rating
    end

    if trips.length == 0
      average = 0
    else
      average = (total_ratings.to_f) / trips.length
    end

    return average.round
  end

end
