Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FAC_KEY'], ENV['FAC_SECRET']
  provider :github, ENV['GIT_KEY'], ENV['GIT_SECRET']
end
