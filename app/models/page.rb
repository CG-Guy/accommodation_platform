class Page < ApplicationRecord

  has_rich_text :description
  has_rich_text :about
  has_rich_text :terms_and_conditions
  has_rich_text :faq
  has_rich_text :terms_of_use
  has_rich_text :introduction
  
end
