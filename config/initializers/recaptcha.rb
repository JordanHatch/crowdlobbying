Recaptcha.configure do |config|
  config.public_key  = ENV['recaptcha_public_key'] || "6Le448kSAAAAAM_yUhP-lIOvLyEBQaOBLx1bFvTl"
  config.private_key = ENV['recaptcha_private_key'] || "6Le448kSAAAAAAGKqLoxTj9-8Heo1PGCs04Yf9Jd"                                             
end