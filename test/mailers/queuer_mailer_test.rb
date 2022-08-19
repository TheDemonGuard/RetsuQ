require "test_helper"

class QueuerMailerTest < ActionMailer::TestCase
  test "new_queuer" do
    mail = QueuerMailer.new_queuer
    assert_equal "New queuer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
