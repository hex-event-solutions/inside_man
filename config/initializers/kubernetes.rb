# frozen_string_literal: true

require 'kubeclient'

Rails.application.configure do
  config.kubeclient = Kubeclient::Client.new(
    "https://#{ENV.fetch('KUBERNETES_HOST')}",
    'v1',
    ssl_options: {
      ca_file: ENV.fetch('KUBERNETES_CERTIFICATE_PATH'),
      verify_ssl: OpenSSL::SSL::VERIFY_PEER
    },
    auth_options: {
      bearer_token_file: ENV.fetch('KUBERNETES_TOKEN_PATH')
    }
  )
end
