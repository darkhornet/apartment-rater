class UnitsController < ApplicationController
  # GET /units
  # GET /units.json
  def index
    @units = Unit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @units }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    @unit = Unit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit }
    end
  end

  # GET /units/new
  # GET /units/new.json
  def new
    @unit = Unit.new
    @apartment = Apartment.find(params[:apartment_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit }
    end
  end

  # GET /units/1/edit
  def edit
    @unit = Unit.find(params[:id])
    @apartment = @unit.apartment
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(unit_params)
binding.pry
    respond_to do |format|
      if @unit.save
        format.html { redirect_to apartment_unit_url(@unit.apartment, @unit), notice: 'Unit was successfully created.' }
        format.json { render json: @unit, status: :created, location: @unit }
      else
        format.html { render action: "new" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /units/1
  # PUT /units/1.json
  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(unit_params)
        format.html { redirect_to apartment_unit_url(@unit.apartment, @unit), notice: 'Unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to apartment_units_url }
      format.json { head :no_content }
    end
  end


private
  def unit_params
    params[:unit].permit(:apartment_id, :bathrooms, :bedrooms, :price, :sqft)
  end
end
