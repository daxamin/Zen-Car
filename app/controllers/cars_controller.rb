class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:edit, :new, :create, :edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    #@cars = Car.search(params[:manufacturer], params[:model])
    @cars = Car.search(params)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
    @car.model = params[:model]
    @car.manufacturer = params[:manufacturer]
    @car.style = params[:style]
    @@recom_id = params[:r_id]

  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
        Recommendation.where(:id => @@recom_id).update_all(:status => "Approved")
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    if @car.status != 'Available'
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Cannot delete Reserved/Checked-out car.' }
        format.json { head :no_content }
      end
    else
      @car.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Car was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:license_no, :manufacturer, :hourly_rate, :model, :location, :style, :status)
    end
  end

