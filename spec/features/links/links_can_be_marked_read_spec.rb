require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Link.create(url:"https://turing.io", title:"Turing", user_id: user.id)
    visit "/"

    within('.link .read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as read"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
  scenario "Mark a link as unread" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    Link.create(url:"https://turing.io", title:"Turing", user_id: user.id, read: true)
    visit "/"

    within('.link .read-status') do
      expect(page).to have_text("true")
    end

    click_on "Mark as unread"

    within('.link .read-status') do
      expect(page).to have_text("false")
    end
  end
end
