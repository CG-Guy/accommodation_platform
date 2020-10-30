class HomeController < ApplicationController
  def index
  end

  def listings
  end

  def register_as_host
  end

  def register_an_experience
  end

  def terms_and_conditions
  end

  def faq
  end

  def event_params
    params.require(:event).permit(:chatra_id, :email, :phone, :home_page_data, :introduction, :about, :terms_and_conditions, :description, :faq, :title, :starts_at, :ends_at, :avatar, :banner, :name,
    videos_attributes: [:id, :path, :title, :description, :video_type, :_destroy],
  end

end
