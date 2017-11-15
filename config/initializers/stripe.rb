#Stripe.api_key = Rails.application.secrets.stripe_private_key


Rails.configuration.stripe = {
  :publishable_key => 'pk_test_mYxJNe1el9f5SukHxK8EadLF',
  :secret_key      => 'sk_test_DLluXDcKHvDWUeVi69OG9NaC'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
