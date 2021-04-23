class Airline < ApplicationRecord
  has_many :flights
  has_many :flights_passengers, through: :flights
  has_many :passengers, through: :flights_passengers

  def distinct_adult_passengers
    passengers.distinct
    .where('age >= 18')
  end
end
