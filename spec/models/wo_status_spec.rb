require 'spec_helper'

describe WoStatus do
  before do
    @status = build(:wo_status)
  end

  describe "validations" do
    it "is valid" do
      @status.should be_valid
    end
  end

  describe "#to_label" do
    it "returns the label" do
      @status.status = "foo"
      @status.to_label.should == "foo"
    end
  end

end
