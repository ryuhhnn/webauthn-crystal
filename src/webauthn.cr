require "./webauthn/*"

module Webauthn
  VERSION = "0.1.0"

  def self.generate_user_id
    configuration.encoder.encode(Random::Secure.random_bytes(64))
  end
end
