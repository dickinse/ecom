if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => ' pk_test_58g0CaNtwnsvabCuzcaxCnM4',
    :secret_key => 'sk_test_nTvzC82L5lonn1WjfJaEjL1w'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
