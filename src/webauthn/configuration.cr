require "./encoder"

module Webauthn
  def self.configuration
    Configuration::INSTANCE
  end

  class Configuration
    INSTANCE = Configuration.new

    getter encoder = Webauthn.standard_encoder
  end
end
