class SubListingsController < ApplicationController
  before_action :set_sub_listing, only: [:show, :edit, :update, :destroy]

  # GET /sub_listings
  # GET /sub_listings.json
  def index
    @sub_listings = SubListing.all
  end

  # GET /sub_listings/1
  # GET /sub_listings/1.json
  def show
  end

  # GET /sub_listings/new
  def new
    @sub_listing = SubListing.new
  end

  # GET /sub_listings/1/edit
  def edit
  end

  # POST /sub_listings
  # POST /sub_listings.json
  def create
    @sub_listing = SubListing.new(sub_listing_params)

    respond_to do |format|
      if @sub_listing.save
        format.html { redirect_to @sub_listing, notice: 'Sub listing was successfully created.' }
        format.json { render :show, status: :created, location: @sub_listing }
      else
        format.html { render :new }
        format.json { render json: @sub_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_listings/1
  # PATCH/PUT /sub_listings/1.json
  def update
    respond_to do |format|
      if @sub_listing.update(sub_listing_params)
        format.html { redirect_to @sub_listing, notice: 'Sub listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_listing }
      else
        format.html { render :edit }
        format.json { render json: @sub_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_listings/1
  # DELETE /sub_listings/1.json
  def destroy
    @sub_listing.destroy
    respond_to do |format|
      format.html { redirect_to sub_listings_url, notice: 'Sub listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_listing
      @sub_listing = SubListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_listing_params
      params.require(:sub_listing).permit(:status, :price, :rooms, :guest)
    end
end
