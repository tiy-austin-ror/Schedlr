class InviteMailer < ApplicationMailer
  default from: 'schedlr@example.com'

  def send_invite(user)
    @user = user
    mail(to: @user.email, subject: "You have been invited to attend an event." )
end
