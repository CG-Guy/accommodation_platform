class SubListingsController < ApplicationController
  include Pundit
  before_action :set_sub_listing, only: [:show, :edit, :update, :destroy] # set @sub_listing...
  before_action :set_sub_listing, only: [:show, :edit, :update, :destroy]

  # GET /sub_listings
  # GET /sub_listings.json
  def index
    @sub_listings = SubListing.all
    @pagy, @sub_listings = pagy(@sub_listings)
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
    @listing = Listing.find(params[:id])
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

  def send_message
    @sub_listing = SubListing.find(params[:sub_listing_id]) 
    CompanyMailer.with(company_id: @sub_listing.id, contact_params: contact_params).contact_email.deliver_later

    respond_to do |format|
      format.html { redirect_to event_company_path(@event, @company), notice: 'Message Sent Succesfully!' }
    end
  end

  def rating
    @sub_listing = SubListing.find(params[:sub_listing_id]) 
    rating = @sub_listing.ratings.where(user: current_user).first_or_initialize
    rating.value = params[:radio1]
    rating.save
  end

  def contact_params
    params.permit(:first_name, :last_name, :contact_number, :email, :topic, :message, :event_id, :company_id, :description_text, :title,
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_listing
      @sub_listing = SubListing.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @sub_listing = nil
    end

    # Only allow a list of trusted parameters through.
    def sub_listing_params
      params.require(:sub_listing).permit(:id, :status, :title, :no_rooms, :no_adults, :no_children, :price, :listing_id, :status, :first_name, :last_name, :description, :about, :terms_and_conditions, :faq, :terms_of_use, :introduction, :attachments, :description_text, :city_town, :street_address, :zip_code, :languages, :country_list, :_destroy,
      :addresses_attributes => [:id, :city_town, :street_address, :zip_code, :_destroy,
      attachments_attributes: [:id, :title, :description, :reference, :attachment, :_destroy]])
    end
end
