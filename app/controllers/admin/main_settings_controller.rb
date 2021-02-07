module Admin
  class MainSettingsController < ApplicationController
    before_action :get_setting, only: [:edit, :update]

    def index
      # authorize MainSetting
    end

    def create
      # authorize MainSetting
      mainsetting_params.keys.each do |key|
        MainSetting.send("#{key}=", mainsetting_params[key].strip) unless mainsetting_params[key].nil?
      end

      trix_params.keys.each do |key|
        MainSetting.find_by_var(key).rich_text.update_column(:body, "Hello")
      end
      
      redirect_to admin_main_settings_path, notice: "Setting was successfully updated."
    end

    def set_editor
      @editor ||= MainSetting.find_by(var: "editor")&.rich_text
    end

    private
      def mainsetting_params
        params.require(:main_setting).permit(:google_analytics_id, :website_title, :banner_title, :banner_text, :banner_text_short, :meta_description, :facebook_url, :twitter_url, :instagram_url, :terms_and_conditions, 
          :linkedin_url, :footer_about, :meta_keywords, :admin_email, :admin_contact, :public_contact_more, :public_email, :public_contact, :public_address])
      end
      def trix_params
        params.permit(:home_page)
      end
  end
end