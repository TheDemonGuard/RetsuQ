# Preview all emails at http://localhost:3000/rails/mailers/queuer_mailer
class QueuerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/queuer_mailer/new_queuer
  def new_queuer
    QueuerMailer.new_queuer
  end

end
