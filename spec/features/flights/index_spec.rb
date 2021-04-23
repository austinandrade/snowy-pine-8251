require 'rails_helper'

RSpec.describe 'flights index' do
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

  it 'lists all flight numbers, names of the airline for those flights, and a list of all the passengers' do
    visit "/flights"

    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@flight_3.number)

    within "#flight-#{@flight_1.id}" do
      expect(page).to have_content(@airline_1.name)
      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content(@passenger_2.name)

    end

    within "#flight-#{@flight_2.id}" do
      expect(page).to have_content(@airline_2.name)
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content(@passenger_4.name)
    end

    within "#flight-#{@flight_3.id}" do
      expect(page).to have_content(@airline_3.name)
      expect(page).to have_content(@passenger_5.name)
      expect(page).to have_content(@passenger_6.name)
    end
  end
end
