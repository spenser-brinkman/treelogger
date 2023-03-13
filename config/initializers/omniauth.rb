Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Rails.application.credentials.GOOGLE_CLIENT_ID,
           Rails.application.credentials.GOOGLE_CLIENT_SECRET, {
             prompt: 'select_account',
             scope: 'email, profile, openid'
           }
end

# OmniAuth.config.allowed_request_methods = %i[get]
