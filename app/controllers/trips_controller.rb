class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    new_trip_info = {
      passenger_id: params[:passenger_id],
      driver_id: Driver.get_available_driver,
      date: Date.new
    }

    @trip = Trip.create(new_trip_info)

    redirect_to passenger_path
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    @trip.assign_attributes(trip_params)

    if @trip.save
      redirect_to trip_path(trip)
    else
      render :edit
    end
  end

  def destroy
     Trip.destroy(params[:id])
     redirect_to trip_path
  end

  private
  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost, :passenger_id, :driver_id)
  end


end
