require 'spec_helper'

describe Authentication do
  before do
    @authentication = build(:authentication)
  end

  describe "validations" do
    it "is valid" do
      @authentication.should be_valid
    end

    # Presence
    %w[user_id provider uid].each do |attr|
      it "errors if #{attr} is blank" do
        @authentication.send("#{attr}=", nil)
        @authentication.should have(1).error_on(attr.to_sym)
      end
    end
  end

end
