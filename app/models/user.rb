class User < ActiveRecord::Base
  has_many :events
  has_many :musicians
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
