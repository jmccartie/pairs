require 'spec_helper'

describe Waiver do
  before do
    @waiver = build(:waiver)
  end

  describe "validations" do
    it "is valid" do
      @waiver.should be_valid
    end

    it "errors if signature is not present" do
      @waiver.signature = nil
      @waiver.should have(1).error_on(:signature)
    end
  end

end
