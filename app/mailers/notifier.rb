class Notifier < ActionMailer::Base
  default :from => "Todd Anderson todd@thehomie.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.news_signup.subject
  #
  def news_signup(user)
    @user = user

    mail :to => user.email, :subject => 'BeelineReader Newsletter Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.news_announcement.subject
  #
  def news_announcement
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
