class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email
  has_many :tweets, dependent: :destroy

  mount_uploader :avatar, PhotoUploader
end
