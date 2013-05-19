unless Rails.env.test?
  email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/smtp.yml"))
  unless email_settings[Rails.env].nil?
    ActionMailer::Base.smtp_settings = email_settings[Rails.env].symbolize_keys
  end
end