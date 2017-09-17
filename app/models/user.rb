# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable,
  # :timeoutable,
  # :omniauthable
  devise :database_authenticatable,
         :registerable,
         :rememberable,
         :confirmable,
         :recoverable,
         :validatable,
         :trackable
end
