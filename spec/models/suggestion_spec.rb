require 'spec_helper'

describe Suggestion do

  let(:suggestion){Suggestion.create(
    title: "Test Title",
    url: "www.goodurl.com"
    )}

  it "is valid with a title and URL" do
    # This is marked as pending because it's a false positive. we have no validation yet.
    expect(suggestion).to be_valid
  end

  it "is invalid without a title" do
    suggestion.title = nil 
    expect(suggestion).to have(1).errors_on(:title)
  end

  it "is invalid without a URL" do
    suggestion.url = nil
    expect(suggestion).to have(1).errors_on(:url)
  end

  it "is valid if a valid URL is supplied" do
    # change to check for validation after building url validation
    expect(suggestion).to be_valid
  end

  # it "accepts bit.ly-shortened URLs" do
  #   suggestion.url = "bit.ly/19vFaz4"
  #   expect(suggestion.url).to match(/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/)
  # end

  it "is invalid when supplied an invalid URL" do
    # change to check for validation after building url validation
    suggestion.url = "1.4.p"
    expect(suggestion).to have(1).errors_on(:url)
  end

  it "belongs to a topic" do
    # Needs work.
    suggestion = Suggestion.new(title: "test title", url: "www.example.com")
    expect(suggestion.topic).to_not be_nil
  end

end
