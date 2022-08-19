class QueuerMailer < ApplicationMailer
  def new_queuer_email
    @queuer = params[:queuer]
    @restaurant = params[:restaurant]
    mail(from: ENV["SMTP_USERNAME"], to: current_user_email, subject: "You joined the queue!")
  end
end
