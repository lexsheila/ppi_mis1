ActionMailer::Base.smtp_settings = {
  address:        'smtp.gmail.com', # default: localhost
  port:           '587',                  # default: 25
  user_name:      'asnamubiru',
  password:       'm0n@715@',
  domain:         'localhost',
  authentication: :plain,                 # :plain, :login or :cram_md5
  :enable_starttls_auto => true
}