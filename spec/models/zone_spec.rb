require 'spec_helper'

describe Zone do
  before do
    @zone = build(:zone)
  end

  describe "validations" do
    it "is valid" do
      @zone.should be_valid
    end
  end

  describe "#to_label" do
    it "returns the label" do
      @zone.zone = "foo"
      @zone.to_label.should == "foo"
    end
  end

end
