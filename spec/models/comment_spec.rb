require 'spec_helper'

describe Comment do
  before do
    @comment = build(:comment)
  end

  describe "validations" do
    it "is valid" do
      @comment.should be_valid
    end

    # Integer
    %w[user_id commentable_id].each do |attr|
      it "errors if #{attr} is not an integer" do
        @comment.send("#{attr}=", "someString")
        @comment.should have(1).error_on(attr.to_sym)
      end
    end

  end
end
