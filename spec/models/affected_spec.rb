require 'spec_helper'

describe Affected do
  before do
    @affected = build(:affected)
  end

  describe "validations" do
    it "is valid" do
      @affected.should be_valid
    end
  end


end
