class WelcomeController < ApplicationController
  def index
    @events = Event.all.order('created_at DESC')
    @current_event = Event.current_event
    @yesterday_event = Event.yesterday_event
    @y = Date.yesterday.strftime('%e %A %Y')
    @d = Date.today.strftime('%e %A %Y')
  end

  def khmer
    @events = Event.khmer
  end

  def western
    @events = Event.western
  end
end
