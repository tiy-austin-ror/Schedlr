class UserMailer < ApplicationMailer
  default from: 'schedlr@example.com'

  def room_confirm(user, room)
    @user = user
    @room = room
    mail(to: @user.email, subject: "You have successfully reserved a room.")
  end

end
