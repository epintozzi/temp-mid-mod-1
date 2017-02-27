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
save_and_open_page
    within('.link .read-status') do
      expect(page).to have_text("true")
    end

  end
end
