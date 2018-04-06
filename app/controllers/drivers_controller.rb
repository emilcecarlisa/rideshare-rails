class DriversController < ApplicationController
# if the driver is selected, show the total revenue , avg rating, --clicking on list will take you to trips page

  def new
    @driver = Driver.new
  end

  def index
    @drivers = Driver.all
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new
    end
  end

  def show
    @driver = Driver.find(params[:id])
    @trips = @driver.trips
    # could also do a nested route
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])

    @driver.assign_attributes(driver_params)

    if @driver.save
      redirect_to driver_path(@driver)
    else
      render :edit
    end
  end

  def destroy
     Driver.destroy(params[:id])

     redirect_to drivers_path
  end

  private
  def driver_params
    return params.require(:driver).permit(:name, :driver_id, :vin, :status)
  end

end
