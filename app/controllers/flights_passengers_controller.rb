class FlightsPassengersController < ApplicationController
  def update
    flight = Flight.find(flights_passenger_params[:id])
    passenger = Passenger.find(flights_passenger_params[:passenger])
    FlightsPassenger.where("flight_id = ?", flight.id).where("passenger_id = ?", passenger.id).destroy_all

    redirect_to "/flights"
  end

  private

  def flights_passenger_params
    params.permit(:id, :passenger, :flight)
  end
end
