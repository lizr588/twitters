class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :username, presence: true
  validates :username, uniqueness: true
  # could also do validates :username, presence: true, uniqueness: true
  
  serialize :following, Array


  has_many :tweeters

  mount_uploader :avatar, AvatarUploader

end
