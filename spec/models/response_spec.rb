require 'spec_helper'

describe Response do
  pending "is valid with a title and URL" do
    # This is marked as pending because it's a false positive. we have no validation yet.
    response = Response.new(title: "test title", URL: "www.example.com")
    expect(response).to be_valid
  end

  pending "has a valid URL" do
    # URL regex here
  end

  it "is invalid without a title" do
    expect(Response.new(title: nil, URL: "www.example.com")).to have(1).errors_on(:title)
  end

  it "is invalid without a URL" do
    expect(Response.new(title: "test title", URL: nil)).to have(1).errors_on(:URL)
  end

  it "belongs to a concern" do
    # Needs work.
    response = Response.new(title: "test title", URL: "www.example.com")
    expect(response.concern).to_not be_nil
  end

end
