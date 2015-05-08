class UserMailer < ApplicationMailer
  default from: 'pickypotluck@gmail.com'

  def invite_email(to_email, from_user, party)
    @to_email = to_email
    @from_user = from_user
    @party = party
    mail(to: @to_email, subject: '#{@from_user.name} invited you to #{@party.name} on Picky Potluck!')
  end
end
