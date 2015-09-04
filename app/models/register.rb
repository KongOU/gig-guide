class Register < ActiveRecord::Base
  belongs_to :event

  validates :firstname, :lastname, :gender, :address, presence: true
end
