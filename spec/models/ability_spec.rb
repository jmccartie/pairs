require 'spec_helper'
require 'cancan/matchers'

describe Ability do

  describe "User" do
    before do
      @user = create :user, role: "User"
      @comment = create(:comment, user: @user)
      @ability = Ability.new(@user)
    end

    it "can manage their own comment" do
      @ability.should be_able_to(:manage, @comment)
    end
  end

  describe "Super Admin" do
    before do
      @user = build :user, role: "Super Admin"
      @ability = Ability.new(@user)
    end

    [:dashboard, :zone, :wo_status, User, Need, Pod, Comment].each do |model|
      it "can manage a #{model}" do
        @ability.should be_able_to(:manage, model)
      end
    end

  end

end