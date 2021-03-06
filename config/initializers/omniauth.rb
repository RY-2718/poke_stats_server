Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
           request_path: '/api/v1/auth/google_oauth2', callback_path: '/api/v1/auth/google_oauth2/callback'
end
