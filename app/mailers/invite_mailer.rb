class InviteMailer < ApplicationMailer
  default from: 'schedlr@example.com'

  def send_invite(invitee)
    @user = invitee.user
    @event = invitee.event
    @event_organizer = @event.user
    mail(to: @user.email, subject: "You have been invited to attend an event." )
  end
end
