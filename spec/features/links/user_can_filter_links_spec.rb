require 'rails_helper'

describe "filtering", :js => :true do
  scenario "user can filter links by read or unread" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Link.create(url: "http://link1.com", title: "link1", user_id: user.id, read: true)
    Link.create(url: "http://link2.com", title: "link2", user_id: user.id, read: false)

    visit "/"

    expect(page).to have_content("link1")
    expect(page).to have_content("link2")
    
    click_on "Only Read Links"

    expect(page).to have_content("link1")
    expect(page).to_not have_content("link2")
  end
end
