Rails.applicatoin.config.middleware.use OmniAuth::Builder do
    provider :google, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end