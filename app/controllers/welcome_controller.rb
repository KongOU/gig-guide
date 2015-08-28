class WelcomeController < ApplicationController
  def index
    @events = Event.all.order('created_at DESC')
    @current_event = Event.current_event
    @d = Date.today.strftime('%e %A %Y')
  end

  def khmer
    @events = Event.khmer
  end

  def western
    @events = Event.western
  end
end
