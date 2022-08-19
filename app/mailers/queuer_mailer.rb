class QueuerMailer < ApplicationMailer
  def new_queuer_email
    @queuer = params[:queuer]
    @restaurant = params[:restaurant]

    # currently sending an email to the env var -> but not to current_user.email
    mail(to: ENV["SMTP_USERNAME"], subject: "You joined the queue!")
  end
end
