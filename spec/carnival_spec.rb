require "./lib/visitor"
require "./lib/ride"
require "./lib/carnival"

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new(6)
    @ride1 = Ride.new({name: "Carousel", min_height: 24, admission_fee: 1, excitement: :gentle})
    @ride2 = Ride.new({name: "Ferris Wheel", min_height: 36, admission_fee: 5, excitement: :gentle})
    @ride3 = Ride.new({name: "Roller Coaster", min_height: 54, admission_fee: 2, excitement: :thrilling})

    @visitor1 = Visitor.new("Bruce", 54, "$10")
    @visitor2 = Visitor.new("Tucker", 36, "$5")
    @visitor3 = Visitor.new("Penny", 64, "$15")
  end

  it "exists and has attributes" do
    expect(@carnival).to be_a(Carnival)
    expect(@carnival.duration).to eq(6)
  end

  it "starts with no rides" do
    expect(@carnival.rides).to eq([])
  end

  it "can add rides" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    expect(@carnival.rides).to eq([@ride1, @ride2, @ride3])
  end

  it "can tell us the most popular ride" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)

    expect(@carnival.most_popular_ride).to eq(@ride1)
  end

  it "can tell us the most profitable ride" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)

    expect(@carnival.most_profitable_ride).to eq(@ride1)
  end

  it "can calculate the total revenue from all rides" do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)

    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor1)
    @ride3.board_rider(@visitor1)
    @ride3.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)

    expect(@carnival.total_revenue).to eq(100)
  end
end
