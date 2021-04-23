class Airline < ApplicationRecord
  has_many :flights
  has_many :flights_passengers, through: :flights
  has_many :passengers, through: :flights_passengers

  def distinct_adult_passengers_ordered_by_flight_attendence_frequency
    passengers
    .distinct
    .select('passengers.*, count(passengers) as total_flights')
    .where('age >= 18')
    .group('passengers.id')
    .order(total_flights: :desc)
  end
end
