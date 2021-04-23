require 'rails_helper'

RSpec.describe 'airlines show' do
  before(:each) do
    @airline_1 = Airline.create!(name: 'United')

    @flight_1 = @airline_1.flights.create!(number: 1234, date: '7/8/2021', departure_city: 'Cleveland', arrival_city: 'Harlem')
    @flight_2 = @airline_1.flights.create!(number: 5678, date: '9/4/2021', departure_city: 'Cincinatti', arrival_city: 'Columbus')
    @flight_3 = @airline_1.flights.create!(number: 91011, date: '11/2/2021', departure_city: 'Austin', arrival_city: 'Boston')

    @passenger_1 = @flight_1.passengers.create!(name: 'Mark', age: 5)
    @passenger_2 = @flight_2.passengers.create!(name: 'Kevin', age: 10)
    @passenger_3 = @flight_3.passengers.create!(name: 'Jessica', age: 44)

    FlightsPassenger.create!(flight: @flight_1, passenger: @passenger_3)
  end

  it 'lists all unique passengers only including adults' do
    visit "/airlines/#{@airline_1.id}"

    expect(page).to have_content(@passenger_3.name, count: 1)
    expect(page).to_not have_content(@passenger_1.name)
    expect(page).to_not have_content(@passenger_2.name)
  end
end
