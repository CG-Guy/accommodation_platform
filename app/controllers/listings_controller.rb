class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :listing_params, :update, :destroy]
  
  def index
    @listings = Listing.all
    @pagy, @listings = pagy(@listings)
  end

  def show
    @review = Review.where(composite: @listing, user: current_user).first_or_initialize

    #define attribute
    @listings = Listing.find(params[:id])
    #Every listing has many sublistings
    @sub_listings = @listing.sub_listings.by_date(params[:checkin],params[:checkout])
    .order('name')
  end

  def new
    @listing = Listing.new
    @listing.build_address
  end

  def edit
    @listing = Listing.find(params[:id])
    @listing.build_address if @listing.address.nil?
  end

  def create
    # @listing  = Listing.create! params.require(:listing).permit(:rich_description, :amenities_description)
    #redirect_to listings

    @listing = Listing.new(listing_params)
    @listing.user = current_user
    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_listings
    @listing = current_user.listings
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:id, :name, :title, :email, :title, :user_id, :status, :attachments, :avatar, :first_name, :last_name, :rich_description, :amenities_description, :listing_id,  :comment, :country_list, :listing_amenities,
      :sub_listings_attributes => [:id, :title, :no_rooms, :no_adults, :no_children, :price, :listing_id, :status, :_destroy], 
      listing_amenities_attributes: [:id, :listing_id, :amenity_item_id, :_destroy],
      :amenity_item_attributes => [:id, :value, :icon, :key, :_destroy], 
      information_blocks_attributes: [:id, :first_name, :last_name, :review, :_destroy],
      attachments_attributes: [:id, :title, :description, :reference, :attachment, :_destroy],
      mail_setting_attributes: [:id, :email, :password, :address, :port, :starttls_auto],
      address_attributes: [:id, :country, :province, :city, :street_address, :zip_code, :_destroy])
    end

    def amadeus
      amadeus = Amadeus::Client.new({
        client_id: ENV['HOTEL_API_ID'],
        client_secret: ENV['HOTEL_API_SECRET']
      })
    end
  
end
