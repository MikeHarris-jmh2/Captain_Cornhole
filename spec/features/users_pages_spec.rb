require "rails_helper"

describe "add user process" do
  it "adds a new user" do
    visit "/"
    click_on  "Register"
    fill_in "Email", :with => "Mike@yahoo.com"
    fill_in "Password", :with => "12345678"
    fill_in "Password confirmation", :with => "12345678"
    click_on "Sign up"
    expect(page).to have_content "successfully"
  end

  it "gives an error if no email is entered" do
  visit "/"
  click_on "Register"
  fill_in "Password", :with => "12345678"
  fill_in "Password confirmation", :with => "12345678"
  click_on "Sign up"
  expect(page).to have_content "blank"
  end
end

describe "will Log in User" do
  it "will log in User" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_on "Sign in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on "Log in"
    expect(page).to have_content "successfully"
  end

  it "gives an error if password doesn't match" do
    user = FactoryGirl.create(:user)
    visit "/"
    click_on "Sign in"
    fill_in "Email", :with => user.email
    click_on "Log in"
    expect(page).to have_content "Invalid"
  end
end
