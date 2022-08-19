class QueuerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.queuer_mailer.new_queuer.subject
  #
  def new_queuer(queuer)
    @queuer = queuer
    @restaurant = queuer.restaurant

    mail to: @queuer.user.email, subject: "You saved a spot on RestsuQ!"
  end
end
