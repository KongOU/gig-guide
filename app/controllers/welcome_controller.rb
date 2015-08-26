class WelcomeController < ApplicationController
  def index
    @events = Event.all.order('created_at DESC')
  end

  def khmer
    @events = Event.khmer
  end
  def western
    @events = Event.western
  end
end
