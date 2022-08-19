# Preview all emails at http://localhost:3000/rails/mailers/queuer_mailer
class QueuerMailerPreview < ActionMailer::Preview
  def new_queuer_email
    # Set up a temporary order for the preview
    queuer = Queuer.new(reservation_name: "Joe Smith", size: "2")
    QueuerMailer.with(queuer: queuer).new_queuer_email
  end
end
