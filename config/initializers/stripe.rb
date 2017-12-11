#Stripe.api_key = Rails.application.secrets.stripe_private_key


Rails.configuration.stripe = {
  :publishable_key => 'pk_test_7Nf0IJvw9cayONEC50VrHiSU',
  :secret_key      => 'sk_test_e8BOYlK37QC77gNVaJL1RsdS'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
