require 'spec_helper'

describe Response do

  let(:response){Response.create(
    title: "Test Title",
    url: "www.goodurl.com"
    )}

  pending "is valid with a title and URL" do
    # This is marked as pending because it's a false positive. we have no validation yet.
    expect(response).to be_valid
  end

  it "is invalid without a title" do
    response.title = nil 
    expect(response).to have(1).errors_on(:title)
  end

  it "is invalid without a URL" do
    response.url = nil
    expect(response).to have(1).errors_on(:url)
  end

  it "is valid if a valid URL is supplied" do
    # change to check for validation after building url validation
    expect(response.url).to match(/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/)
  end

  # it "accepts bit.ly-shortened URLs" do
  #   response.url = "bit.ly/19vFaz4"
  #   expect(response.url).to match(/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/)
  # end

  it "is invalid when supplied an invalid URL" do
    # change to check for validation after building url validation
    response.url = "1.4.p"
    expect(response.url).not_to match(/((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/)
  end

  it "belongs to a concern" do
    # Needs work.
    response = Response.new(title: "test title", url: "www.example.com")
    expect(response.concern).to_not be_nil
  end

end
