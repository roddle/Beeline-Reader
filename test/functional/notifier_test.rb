require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "news_signup" do
    mail = Notifier.news_signup
    assert_equal "News signup", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "news_announcement" do
    mail = Notifier.news_announcement
    assert_equal "News announcement", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
