require "base64"

module Webauthn
  def self.standard_encoder
    Encoder::INSTANCE
  end

  class Encoder
    INSTANCE          = Encoder.new
    STANDARD_ENCODING = :base64url

    property encoding : Symbol | Nil = STANDARD_ENCODING

    def encode(data)
      case @encoding
      when :base64
        Base64.strict_encode(data)
      when :base64url
        Base64.urlsafe_encode(data, padding: false)
      when nil, false
        data
      else
        raise "Unsupported or unknown encoding: #{@encoding}"
      end
    end

    def decode(data)
      case @encoding
      when :base64, :base64url
        Base64.decode(data)
      when nil, false
        data
      else
        raise "Unsupported or unknown encoding: #{@encoding}"
      end
    end
  end
end
