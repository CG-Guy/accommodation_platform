class User < ApplicationRecord
  self.table_name = 'users'
  has_one :site_admin, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :reservations
  


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
