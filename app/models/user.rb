# frozen_string_literal: true

# Model for the Users
class User < ApplicationRecord
  # Setting the relations
  has_many :lists
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 50 },
            format: { with:	VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  # after_create :welcome_send
  
  private
  
  def welcome_send
    UserMailer.welcome_email(@user).deliver
    redirect_to root_path, alert: 'Thank you'
  end
end
