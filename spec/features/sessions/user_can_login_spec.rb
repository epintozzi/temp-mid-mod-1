require "rails_helper"

describe "login" do
  scenario "user can log in" do
    User.create(email: "email@example.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in "email", with: "email@example.com"
    fill_in "password", with: "password"
    click_on "Submit"

    expect(page).to have_content("You have successfully logged in.")
    expect(current_path).to eq(root_path)
  end
  scenario "user sees error message if log in attempt was unsuccessful" do
    visit login_path
    fill_in "email", with: "email@example.com"
    click_on "Submit"

    expect(page).to have_content("There was a problem logging in. Please try again.")
  end
  scenario "unauthenticated user is redirected to login page when they visit index" do
    visit root_path
    expect(current_path).to eq(login_path)
  end
end
