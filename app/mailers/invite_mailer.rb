class InviteMailer < ApplicationMailer
  default from: 'schedlr@example.com'

  def send_invite(invite)
    @user = invite.user
    @event = invite.event
    @event_organizer = @event.user
    mail(to: @user.email, subject: "You have been invited to attend an event." )
end
