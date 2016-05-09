require 'spec_helper'
require 'rails_helper'

feature "auth" do

  feature "the signup process" do
    it "has a new user page" do

      visit "/users/new"
      expect(page).to have_content("Create User")
    end
    feature "signing up a user" do

      it "shows username on the homepage after signup" do
        visit "/users/new"
        fill_in 'Username', with: "testing_username"
        fill_in 'Password', with: "biscuits"
        click_on "Create User"
        expect(page).to have_content("Homepage")
      end

    end
  end

  feature "logging in" do
    scenario "shows username on the homepage after login" do
      visit "/users/new"
      fill_in 'Username', with: "testing_username"
      fill_in 'Password', with: "biscuits"
      click_on "Create User"

      visit "/session/new"
      fill_in 'Username', with: "testing_username"
      fill_in 'Password', with: "biscuits"
      click_on "Sign in"
      expect(page).to have_content("testing_username")
    end

  end

  feature "logging out" do

    let!(:user) do
      FactoryGirl.create(:user)
    end

    scenario "begins with logged out state" do
      visit "users/#{user.id}"
      expect(page).to have_link("Log in")
    end

    scenario "doesn't show username on the homepage after logout" do
      sign_in_user(user)
      click_on "Sign out"
      expect(page).not_to have_content(user.username)

    end
  end
end
