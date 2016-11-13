require "rails_helper"

describe "adding activities" do
  it "allows a user to create activities" do
    visit new_activity_path
    fill_in "Subject", with: "Call to John"
    fill_in "Info", with: "Call was made and everything goes wrong"
    click_on("Add activity")
    visit activities_path
    expect(page).to have_content("Call to John")
    expect(page).to have_content("Call was made and everything goes wrong")
  end
  
end