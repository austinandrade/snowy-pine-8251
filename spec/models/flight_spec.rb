require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it {should belong_to :airline}
    it { should have_many(:flights_passengers) }
    it { should have_many(:passengers).through(:flights_passengers) }
  end

  before(:each) do
    @airline_1 = Airline.create!(name: 'United')
    @airline_2 = Airline.create!(name: 'Kangroo Airlines')
    @airline_3 = Airline.create!(name: 'Fly high')

    @flight_1 = @airline_1.flights.create!(number: 1234, date: '7/8/2021', departure_city: 'Cleveland', arrival_city: 'Harlem')
    @flight_2 = @airline_2.flights.create!(number: 5678, date: '9/4/2021', departure_city: 'Cincinatti', arrival_city: 'Columbus')
    @flight_3 = @airline_3.flights.create!(number: 91011, date: '11/2/2021', departure_city: 'Austin', arrival_city: 'Boston')

    @passenger_1 = @flight_1.passengers.create!(name: 'Mark', age: 22)
    @passenger_2 = @flight_1.passengers.create!(name: 'Kevin', age: 17)

    @passenger_3 = @flight_2.passengers.create!(name: 'Jessica', age: 44)
    @passenger_4 = @flight_2.passengers.create!(name: 'Ashley', age: 55)

    @passenger_5 = @flight_3.passengers.create!(name: 'Tom', age: 66)
    @passenger_6 = @flight_3.passengers.create!(name: 'Carl', age: 77)
  end

  describe 'instance methods' do
    describe '#airline_name' do
      it 'returns the name of the airline for the flight' do
        expect(@flight_1.airline_name).to eq(@airline_1.name)
      end
    end
  end
end
