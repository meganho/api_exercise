class User < ApplicationRecord

mount_uploader :avatar, AvatarUploader

before_create :generate_authentication_token

      def generate_authentication_token
        self.authentication_token = Devise.friendly_token
      end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :reservations

end
