require 'spec_helper'

describe Contact do
  before do
    @contact = build(:contact, first_name: "Joe", last_name: "Schmoe")
    @contact.address = build(:address, latitude: "123.0", longitude: "456.0")
  end

  describe "validations" do
    it "is valid" do
      @contact.should be_valid
    end
  end

  describe "#latitude" do
    it "delegates to the address" do
      @contact.latitude.should == 123.0
    end
  end

  describe "#longitude" do
    it "delegates to the address" do
      @contact.longitude.should == 456.0
    end
  end

  describe "#gmaps4rails_address" do
    it "returns lat and long as a string" do
      @contact.gmaps4rails_address.should == "123.0, 456.0"
    end
  end

  describe "name" do
    it "returns the full name" do
      @contact.name.should == "Joe Schmoe"
    end
  end

end
