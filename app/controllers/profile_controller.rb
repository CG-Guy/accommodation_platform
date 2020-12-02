class ProfileController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index] # Devise Authentication

  def show
    @user = current_user
  end

  def new_profile
    @user = User.new
  end

  # GET /users/1/edit
  def edit
   @user = current_user
   @user.build_site_admin unless @user.site_admin.present?
  end
 
  # POST /users
  # POST /users.json
  def create
    authorize User
    @user = User.new(profile_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # authorize @user
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to User, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def navigation_cards
  end

  def edit_profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

  def profile_params
    params.require(:user).permit(:name, :last_name, :email, :country, :phone, :avatar,
    sub_listing_attributes: [:id, :listing_id, :status, :_destroy])
  end
end

