require 'spec_helper'

describe Address do
  before do
    @address = build(:address)
  end

  describe "validations" do
    it "is valid" do
      @address.should be_valid
    end
  end

end
