require 'spec_helper'

describe Role do
  before do
    @role = build(:role)
  end

  describe "validations" do
    it "is valid" do
      @role.should be_valid
    end
  end

  describe "#to_label" do
    it "returns the label" do
      @role.title = "foo"
      @role.to_label.should == "foo"
    end
  end

end
