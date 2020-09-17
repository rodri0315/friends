Mailgun.configure do |config|

  if Rails.env.development?
    config.api_key = Rails.application.credentials.dig(:mailgun_api_key)
  else
    config.api_key = ENV["MAILGUN_API_KEY"]
  end
end