class Origin < ActiveRecord::Base
  has_many :events
  has_many :musicians
  rails_admin do
    visible false
  end
end
