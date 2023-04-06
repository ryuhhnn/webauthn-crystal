require "./spec_helper"

describe Webauthn do
  it "has a version number" do
    Webauthn::VERSION.should_not be_nil
  end

  describe "#generate_user_id" do
    context "when encoding is base64url" do
      before_each do
        Webauthn.configuration.encoder.encoding = :base64url
      end

      user_id = Webauthn.generate_user_id

      it "is encoded" do
        user_id.should be_a(String)
      end

      it "is 64 bytes long" do
        Webauthn.standard_encoder.decode(user_id).size.should eq(64)
      end
    end

    context "when encoding is base64" do
      before_each do
        Webauthn.configuration.encoder.encoding = :base64
      end

      user_id = Webauthn.generate_user_id

      it "is encoded" do
        user_id.should be_a(String)
      end

      it "is 64 bytes long" do
        Webauthn.standard_encoder.decode(user_id).size.should eq(64)
      end
    end

    context "when not encoding" do
      Webauthn.configuration.encoder.encoding = nil
      user_id = Webauthn.generate_user_id

      it "is 64 bytes long" do
        user_id.size.should eq(64)
      end
    end
  end
end
