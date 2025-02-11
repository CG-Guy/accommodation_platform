# RailsSettings Model
class MainSetting < RailsSettings::Base
   # cache_prefix { "v1" }
   field :website_title, default: "Website Title Here"
   field :banner_title, default: "Banner Title Here"
   field :banner_text, default: "Banner Text Here"
   field :meta_description, default: "Google Meta Description Here"
   field :meta_keywords, default: "Google Meta keywords Here"
   field :facebook_url, default: "fabook URL Here"
   field :twitter_url, default: "Twitter URL Here "
   field :instagram_url, default: "Instagram URL Here"
   field :linkedin_url, default: "Linkedin URL here"
   field :footer_about, default: "Footer About Here"
   field :admin_email, default: "Admin Email Here"
   field :admin_contact, default: "Admin Contact Here"
   field :public_contact, default: "Public Contact Here"
   field :public_address, default: "Public Address Here"
   field :public_contact_more, default: "Public Contact More Here"
   field :public_email, default: "Public Email Here"
   field :logo, default: "logo", readonly: true
   field :banner, default: "banner", readonly: true
   field :inner_page_banner, default: "Inner Page banner", readonly: true
   field :google_analytics_id, default: ""
   field :home_page, default: "Home"
   field :terms_and_conditions, default: "TandC"
   field :amenity_item
   has_rich_text :rich_text

   has_many :popular_destinations, dependent: :destroy
   has_one_attached :file, dependent: :destroy # used for any of the above records that require an attachment
   has_many :amenity_item, as: :composite, dependent: :destroy
   accepts_nested_attributes_for :amenity_item, allow_destroy: true, reject_if: :all_blank
   accepts_nested_attributes_for :popular_destinations, allow_destroy: true
   # field :readonly_item, type: :integer, default: 100, readonly: true
   # field :user_limits, type: :integer, default: 20
   # field :exchange_rate, type: :float, default: 0.123
   # field :admin_emails, type: :array, default: %w[admin@rubyonrails.org]
   # # Override array separator, default: /[\n,]/ split with \n or comma.
   # field :tips, type: :array, separator: /[\n]+/
   # field :captcha_enable, type: :boolean, default: 1
   # field :notification_options, type: :hash, default: {
   #   send_all: true,
   #   logging: true,
   #   sender_email: "foo@bar.com"
   # }

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
end
