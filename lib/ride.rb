class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log

  def initialize(ride_info)
    @name = ride_info[:name]
    @min_height = ride_info[:min_height]
    @admission_fee = ride_info[:admission_fee]
    @excitement = ride_info[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end

  # def total_revenue
  # end

  def board_rider(visitor)
    if can_ride?(visitor)
      @rider_log[visitor] ||= 0
      @rider_log[visitor] += 1
    else
      raise "heck"
    end
  end

  def can_ride?(visitor)
    visitor.tall_enough?(@min_height) &&
      visitor.preferences.include?(@excitement) &&
      visitor.spending_money >= @admission_fee
  end
end
