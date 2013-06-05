require 'spec_helper'

describe WorkOrder do
  before do
    @wo = build(:work_order)
  end

  describe "validations" do
    it "is valid" do
      @wo.should be_valid
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
