class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :update, :destroy]

  # GET /venues
  def index
    @venues = Venue.all

    render json: @venues
  end

  # GET /venues/1
  def show
    if @venue
      resp = {}
      resp[:venue] = {layout: {row: @venue.layout_row, column: @venue.layout_column}}
      resp[:seats] = get_seats params
      render json: resp
    else
      render json: {error: "not available"}, status: 400
    end
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      render json: @venue, status: :created, location: @venue
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /venues/1
  def update
    if @venue.update(venue_params)
      render json: @venue
    else
      render json: @venue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /venues/1
  def destroy
    @venue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find_by(name: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def venue_params
      params.require(:venue).permit(:name, :layout_row, :layout_column)
    end

    def get_seats params
      resp = {}
      logger.debug "somappa #{params}"
      if params.has_key? "requested_seats" 
        if params.requested_seats > 1

        else
          # Get middle first by descending closest
          seats = @venue.seats.where(status: "AVAILABLE").order(closest: "asc").order(created_at: "asc").limit(3)
          seats.each do |seat|
            resp[seat.seat_id] = {id: seat.seat_id, row: seat.row, column: seat.column, status: seat.status}
          end
        end
      else  
        # Get middle first by descending closest
        seats = @venue.seats.where(status: "AVAILABLE").order(closest: "asc").order(created_at: "asc").limit(3)
        seats.each do |seat|
          resp[seat.seat_id] = {id: seat.seat_id, row: seat.row, column: seat.column, status: seat.status}
        end
      end
      return resp
    end
end