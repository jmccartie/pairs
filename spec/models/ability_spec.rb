require 'spec_helper'
require 'cancan/matchers'

describe Ability do

  before(:each) do
    @user = build :user
    @ability = Ability.new(@user)
  end

  describe "Super Admin" do

    [:dashboard, :zone, :role, :wo_status, User, Need].each do |model|
      it "can manage a #{model}" do
        @ability.should be_able_to(:manage, model)
      end
    end

  end

end