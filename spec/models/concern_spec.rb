require 'spec_helper'

describe Concern do
  pending "is valid with a title and description" do
    # This is marked as pending because it's a false positive. we have no validation yet.
    concern = Concern.new(title: "test title", description: "test description")
    expect(concern).to be_valid
  end

  it "is invalid without a title" do
    expect(Concern.new(title: nil, description: "test description")).to have(1).errors_on(:title)
  end

  it "is invalid without a description" do
    expect(Concern.new(title: "test title", description: nil)).to have(1).errors_on(:description)
  end

  it "belongs to a user" do
    # This one needs help, clearly.
    concern = Concern.new(title: "test title", description: "test description")
    expect(concern.user).to_not be_nil
  end

  it "can build a response onto itself"
end
