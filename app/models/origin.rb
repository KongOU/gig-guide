class Origin < ActiveRecord::Base
  has_many :events
  has_many :musicians
end
