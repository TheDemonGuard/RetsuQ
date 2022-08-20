# config/initializers/smtp.rb
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: ENV['miapaylagvargas@gmail.com'],
  password: ENV['drxigtvdzrkqgals'],
  authentication: :login,
  enable_starttls_auto: true
}
