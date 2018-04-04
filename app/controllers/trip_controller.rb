class TripController < ApplicationController

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
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
    return params.require(:trip).permit(:date, :rating, :cost)
  end

end
