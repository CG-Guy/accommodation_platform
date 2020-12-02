class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_one_attached :avatar, dependent: :destroy
  
end

def edit_profile
end

# validates :avatar

def profile
  self.status = "enabled"
end
  