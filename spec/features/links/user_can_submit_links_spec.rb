require "rails_helper"

describe "user submits link", :js => :true do
  scenario "user only sees their own links" do
    user = create(:user)
    user_2 = create(:user, email: "new@email.com")
    link = Link.create(url: "http://www.google.com", title: "Google", user_id: user.id)
    link = Link.create(url: "http://www.facebook.com", title: "Facebook", user_id: user_2.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("Google")
    expect(page).to_not have_content("Facebook")
  end
end
