require "test_helper"

class QueuerMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "new queuer email" do
    # Set up a queuer based on the fixture
    queuer = queuers(:one)

    # Set up an email using the queuer contents
    email = QueuerMailer.with(queuer: queuer).new_queuer_email

    # Check if the email is sent
    assert_emails 1 do
      email.deliver_now
    end

    # Check the contents are correct
    assert_equal [ENV[ADMIN_EMAIL]], email.from
    assert_equal [ENV[ADMIN_EMAIL]], email.to
    assert_equal "You joined the queue!", email.subject
    assert_match queuer.reservation_name, email.html_part.body.encoded
    assert_match queuer.reservation_name, email.text_part.body.encoded
    assert_match queuer.size, email.html_part.body.encoded
    assert_match queuer.size, email.text_part.body.encoded
  end
end
