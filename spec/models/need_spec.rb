require 'spec_helper'

describe Need do
  before do
    @need = build(:need)
  end

  describe "validations" do
    it "is valid" do
      @need.should be_valid
    end
  end

  describe "#latitude" do
    it "returns the latitude of the affected's address" do
      pending "law of demeter violation"
    end
  end

  describe "#longitude" do
    it "returns the longitude of the affected's address" do
      pending "law of demeter violation"
    end
  end

  describe "#gmails4rails_infowindow" do
    it "returns a link"
  end
end
