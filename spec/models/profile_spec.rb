require 'spec_helper'

describe Profile do

  let(:user) { FactoryGirl.create(:user) }
  before { @profile = user.profiles.build(name: "Test Org Name ", address: "123 Main st, Town, US, 90210", url: "http://www.google.com") }

  subject { @profile }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:url) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Profile.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @profile.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @profile.name = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @profile.name = "a" * 141 }
    it { should_not be_valid }
  end
end
