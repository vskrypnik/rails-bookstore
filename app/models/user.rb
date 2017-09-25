# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable,
  # :timeoutable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :omniauthable,
         :confirmable,
         :recoverable,
         :validatable,
         :trackable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]

      # If you are using confirmable and the provider(s) you use validate
      # emails, uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end
end
