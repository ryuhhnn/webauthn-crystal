require "../spec_helper"

describe Webauthn::Encoder do
  it "defaults to base64url" do
    Webauthn.configuration.encoder.encoding = :base64url
    Webauthn.standard_encoder.encoding.should eq(:base64url)
  end
end
