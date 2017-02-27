require "rails_helper"

describe "/links/:id/edit" do
  scenario "authenticated user can edit link" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    link = Link.create(url: "http://url.com", title: "Title", user_id: user.id)

    visit root_path

    click_on "Edit"
    expect(current_path).to eq(edit_link_path(link))

    fill_in "link[title]", :with => "New title"
    click_on "Update Link"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("New title")
    expect(page).to have_content("Your link has been updated")
  end
  scenario "user can't update link with invalid data" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    link = Link.create(url: "http://url.com", title: "Title", user_id: user.id)

    visit root_path

    click_on "Edit"
    expect(current_path).to eq(edit_link_path(link))

    fill_in "link[url]", :with => "turing.io"
    click_on "Update Link"

    expect(page).to have_content("There was a problem.")
  end
end
