class Driver < ApplicationRecord
  has_many :trips

  FEE = 1.65
  DRIVER_SHARE = 0.8

  def total_revenue

    subtotal = 0
    trips.each do |trip|
      subtotal += trip.cost - FEE
    end

    total = subtotal * DRIVER_SHARE
    return total.to_f
  end

  # def avg_revenue
  #   avg_revenue = (total_revenue/drivers.length)
  #   return avg_revenue_per_hr = (avg_revenue/60).round(2)
  # end

end
