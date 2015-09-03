class InviteMailer < ApplicationMailer
  def new_user_invite(invite, invite_url)
    @sender = invite.sender.email
    @link = invite_url
    mail( :to => invite.email, :from => @sender, :subject => "You've been invited to the textit tester app" )
  end
end
