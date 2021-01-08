class SiteFilesController < ApplicationController
  def upload
    if params[:logo].present?
      @logo.attach(params[:logo]) 
      @logo.reload
    end
    if params[:banner].present?
      @banner.attach(params[:banner]) 
      @banner.reload
    end
    if params[:inner_page_banner].present?
      @inner_page_banner.attach(params[:inner_page_banner]) 
      @inner_page_banner.reload
    end
      render js: "window.location = '#{admin_main_setting_path}'"
  end
end

