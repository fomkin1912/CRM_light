require "rails_helper"

describe "adding activity_types" do
  it "allows a user to create activity type" do
    visit new_activity_type_path
    fill_in "Title", with: "Call to John"
    click_on("Add type")
    visit activity_types_path
    expect(page).to have_content("Call to John")
   end
  
end