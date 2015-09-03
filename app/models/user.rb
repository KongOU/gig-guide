class User < ActiveRecord::Base
  has_many :events
  has_many :musicians
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  rails_admin do
    navigation_label 'Administrator'
    navigation_icon 'icon-user'
    label " User"
    list do
      field :admin
      field :username
      field :email
    end

    edit do
      field :admin
      field :username
      field :email
      field :password
      field :password_confirmation
    end
  end
end
