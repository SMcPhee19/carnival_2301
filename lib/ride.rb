class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
  def initialize(ride_data)
    @name = ride_data[:name]
    @min_height = ride_data[:min_height]
    @admission_fee = ride_data[:admission_fee]
    @excitement = ride_data[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end 

  def board_rider(visitor)
    ## if the the visitor is tall enough AND the exitment is in their preferences
    if visitor.height >= @min_height && visitor.preferences.include?(@excitement)

      ## add them to the rider_log hash
      rider_log[visitor] += 1 

      ## decrese visitor spending money by the cost of the ride
      visitor.spending_money -= @admission_fee

      ## add the cost of the ride*number of riders to total_revenue
      # @total_revenue += @admission_fee
    end
  end

end
