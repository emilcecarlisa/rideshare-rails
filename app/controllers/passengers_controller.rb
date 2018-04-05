class PassengersController < ApplicationController

  def new
    @passenger = Passenger.new
  end

  def index
    @passenger = Passenger.all
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to '/passengers'
    else
      render :new
    end
  end

  def update
    updated_info = params[:passenger]
    @passenger = Passenger.find(passenger_id)
    @passenger.assign_attributes(passenger_params)

    if @passenger.save
      redirect_to passenger_path(passenger)
    else
      render :edit
    end
  end

  def show
    @passenger = Passenger.find(params[:id])
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def destroy
    Passenger.destroy(params[:id])
    redirect_to passengers_path
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
