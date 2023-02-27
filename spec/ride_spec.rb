require 'rspec'
require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  let (:ride1) {Ride.new({ 
    name: 'Carousel',
    min_height: 24,
    admission_fee: 1,
    excitement: :gentle })}
  let (:ride2) {Ride.new({
    name: 'Ferris Wheel',
    min_height: 36,
    admission_fee: 5,
    excitement: :gentle })}
  let (:ride3) {Ride.new({
    name: 'Roller Coaster',
    min_height: 54,
    admission_fee: 2,
    excitement: :thrilling })}

  let (:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let (:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let (:visitor3) {Visitor.new('Penny', 64, '$15')}

  describe '#it initializes with attributes' do
    it 'exists' do
      expect(ride1).to be_a Ride
      expect(ride2).to be_a Ride
      expect(ride3).to be_a Ride
    end

    it 'the ride has a name' do
      expect(ride1.name).to eq("Carousel")
      expect(ride2.name).to eq("Ferris Wheel")
      expect(ride3.name).to eq("Roller Coaster")
    end

    it 'the ride has a minimum height' do
      expect(ride1.min_height).to eq(24)
      expect(ride2.min_height).to eq(36)
      expect(ride3.min_height).to eq(54)
    end

    it 'the ride has an admission fee' do
      expect(ride1.admission_fee).to eq(1)
      expect(ride2.admission_fee).to eq(5)
      expect(ride3.admission_fee).to eq(2)
    end

    it 'the ride has an excitement level' do
      expect(ride1.excitement).to eq(:gentle)
      expect(ride2.excitement).to eq(:gentle)
      expect(ride3.excitement).to eq(:thrilling)
    end

    it 'the ride starts with zero total revenue' do
      expect(ride1.total_revenue).to eq(0)
      expect(ride2.total_revenue).to eq(0)
      expect(ride3.total_revenue).to eq(0)
    end
  end

  describe '#the riders interact with the ride' do
    it 'the riders board the ride and are shown correctly on the rider log' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      ride3.board_rider(visitor1) ## won't ride because not in thier preferences
      ride3.board_rider(visitor2) ## won't ride because not tall enough
      ride3.board_rider(visitor3)

      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      expect(ride3.rider_log).to eq({visitor3 => 1})
    end

    it 'when a visitor rides a ride it decrements their spending money' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      ride3.board_rider(visitor1) ## won't ride because not in thier preferences
      ride3.board_rider(visitor2) ## won't ride because not tall enough
      ride3.board_rider(visitor3)

      expect(visitor1.spending_money).to eq(8)
      expect(visitor2.spending_money).to eq(4)
      expect(visitor3.spending_money).to eq(13)
    end

    xit 'the ride tracks its total revenue' do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)

      ride1.board_rider(visitor1)
      ride1.board_rider(visitor2)
      ride1.board_rider(visitor1)

      ride3.board_rider(visitor1) ## won't ride because not in thier preferences
      ride3.board_rider(visitor2) ## won't ride because not tall enough
      ride3.board_rider(visitor3)

      expect(ride1.total_revenue).to eq(3)
      expect(ride3.total_revenue).to eq(2)
    end
  end
end