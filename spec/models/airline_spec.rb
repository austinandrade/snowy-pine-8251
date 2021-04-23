require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
    it { should have_many(:flights_passengers).through(:flights) }
    it { should have_many(:passengers).through(:flights_passengers) }
  end

  before(:each) do
    @airline_1 = Airline.create!(name: 'United')

    @flight_1 = @airline_1.flights.create!(number: 1234, date: '7/8/2021', departure_city: 'Cleveland', arrival_city: 'Harlem')
    @flight_2 = @airline_1.flights.create!(number: 5678, date: '9/4/2021', departure_city: 'Cincinatti', arrival_city: 'Columbus')
    @flight_3 = @airline_1.flights.create!(number: 91011, date: '11/2/2021', departure_city: 'Austin', arrival_city: 'Boston')

    @passenger_1 = @flight_1.passengers.create!(name: 'Mark', age: 5)
    @passenger_2 = @flight_2.passengers.create!(name: 'Kevin', age: 10)
    @passenger_4 = @flight_2.passengers.create!(name: 'Susan', age: 12)
    @passenger_3 = @flight_3.passengers.create!(name: 'Jessica', age: 44)
    @passenger_5 = @flight_3.passengers.create!(name: 'Kelly', age: 25)

    FlightsPassenger.create!(flight: @flight_1, passenger: @passenger_3)
  end

  describe 'instance methods' do
    describe '#distinct_adult_passengers' do
      it 'returns the names of all distinct adult passengers with an age >= 18 ' do
        expect(@airline_1.distinct_adult_passengers).to contain_exactly(@passenger_3, @passenger_5)
        expect(@airline_1.distinct_adult_passengers).to_not include(@passenger_1, @passenger_2, @passenger_4)
      end
    end
  end
end
