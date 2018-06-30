class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email
  has_many :tweets, dependent: :destroy
  has_many :replies, dependent: :restrict_with_error
  has_many :followships,dependent: :destroy
  has_many :followings, through: :followships
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :inverse_followships, source: :user

  mount_uploader :avatar, PhotoUploader

  def admin?
    self.role == "admin"
  end
end
