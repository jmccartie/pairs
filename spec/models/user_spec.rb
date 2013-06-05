require 'spec_helper'

describe User do
  before do
    @user = build(:user)
  end

  describe "validations" do
    it "is valid" do
      @user.should be_valid
    end
  end

  describe "#profile_complete?" do
    context "when user has a complete contact" do
      it "returns true" do
        @user.contact = build(:contact)
        @user.profile_complete?.should be_true
      end
    end

    context "when some fields are missing" do
      it "returns false" do
        @user.contact = nil
        @user.profile_complete?.should be_false
      end
    end
  end

  describe "after_create" do
    it "sets role" do
      @user.role == nil
      @user.save!
      @user.role.should be_kind_of Role
    end
  end

end
