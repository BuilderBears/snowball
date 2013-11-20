require 'spec_helper'

describe Topic do
  pending "is valid with a title and description" do
    # This is marked as pending because it's a false positive. we have no validation yet.
    topic = Topic.new(title: "test title", description: "test description")
    expect(topic).to be_valid
  end

  it "is invalid without a title" do
    expect(Topic.new(title: nil, description: "test description")).to have(1).errors_on(:title)
  end

  it "is invalid without a description" do
    expect(Topic.new(title: "test title", description: nil)).to have(1).errors_on(:description)
  end

  it "belongs to a user" do
    # This one needs help, clearly.
    topic = Topic.new(title: "test title", description: "test description")
    expect(topic.user).to_not be_nil
  end

  it "can build a suggestion onto itself"
end
