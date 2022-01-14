# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  include DeviseTokenAuth::Concerns::User
  has_one :admin
  has_many :reviews
  has_many :orders
  accepts_nested_attributes_for :admin, allow_destroy: true
end
