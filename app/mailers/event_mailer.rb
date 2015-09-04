class EventMailer < ApplicationMailer

  def create_event_mailer(event)
    @event = event

    mail to: @event.user.email, subject: "New Event Comming!"
  end
end
