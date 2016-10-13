Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['9FJMffHfmzZtKx3Yl6jFp8i7D'], ENV['RR0GHi30rz1yPPpJjsuWliIi6bZ9tIT1ybdv4vgnet5hzFJ1g5']
end