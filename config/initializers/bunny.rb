# frozen_string_literal: true

require 'bunny'

Rails.application.configure do
  config.bunny = Bunny.new(
    {
      host: ENV.fetch('RABBIT_HOST'),
      port: ENV.fetch('RABBIT_PORT'),
      ssl: false,
      vhost: '/',
      user: ENV.fetch('RABBIT_USER'),
      pass: ENV.fetch('RABBIT_PASS'),
      heartbeat: :server,
      frame_max: 131_072,
      auth_mechanism: 'PLAIN'
    }
  )
end
