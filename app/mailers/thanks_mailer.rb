class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.send_when_signup.subject
  #
  def send_when_signup(name,email)
    @greeting = "Hi"
    @name = name
    mail to: email, subject: "Registration Complete!"
  end
end
