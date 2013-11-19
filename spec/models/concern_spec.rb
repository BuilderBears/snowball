require 'spec_helper'

describe Concern do
  let(:user){User.create(
    name: "Joe User",
    email: "joe@user.com"
  )}
  let(:concern){Concern.create(
    title: "Test Title",
    description: "This is a test description.",
  )}
  it "is valid with a title and description" do
    expect(concern).to be_valid
  end

  it "is invalid without a title" do
    concern.title = nil
    expect(concern).to have(1).errors_on(:title)
  end

  it "is invalid without a description" do
    concern.description = nil
    expect(concern).to have(1).errors_on(:description)
  end

  it "belongs to a user" do
    expect(concern.user).to_not be_nil
  end

  it "can build a response onto itself"
end
