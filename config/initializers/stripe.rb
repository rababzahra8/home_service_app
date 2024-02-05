# config/initializers/stripe.rb

Rails.configuration.stripe = {
  publishable_key: ENV.fetch('STRIPE_PUBLIC_KEY', nil),
  secret_key: ENV.fetch('STRIPE_PRIVATE_KEY', nil)
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
