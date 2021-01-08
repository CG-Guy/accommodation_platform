class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
  protect_from_forgery with: :exception, prepend: true
  before_action :set_logo
  before_action :set_banner
  before_action :set_inner_page_banner
  before_action :set_editor

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    sign_out current_user # method that will destroy the user cookies
    # redirect_to sign_in_create_event_path(Event.find(params[:id])), notice: 'Something went wrong. Please try signing in again'
  end

  private
  
  def set_logo
    @logo ||= MainSetting.find_by(var: "logo")&.file
  end

  def set_banner
    @banner ||= MainSetting.find_by(var: "banner")&.file
  end

  def set_inner_page_banner
    @inner_page_banner ||= MainSetting.find_by(var: "inner_page_banner")&.file
  end

  def set_editor
    @editor ||= MainSetting.find_by(var: "editor")&.rich_text
  end

end
