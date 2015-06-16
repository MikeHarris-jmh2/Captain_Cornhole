require "rails_helper"

describe "add product process" do
    it "add a new product" do
      user = FactoryGirl.create(:user)
      product = FactoryGirl.create(:product)
      visit "/"
      click_on "Sign in"
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_on "Log in"
      click_on "Add Product"
      fill_in "Name", :with => product.name
      fill_in "Description", :with => product.description
      fill_in "Price", :with => product.price
      click_on "Create Product"
      expect(page).to have_content "successfully"
    end
end
