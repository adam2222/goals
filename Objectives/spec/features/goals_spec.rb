require 'spec_helper'
require 'rails_helper'

feature "Goals" do
  feature "user page" do
    let!(:user) { FactoryGirl.create(:user) }

    let!(:goal) { Goal.create(user_id: user.id, body: "Get more sleep!!") }

    before(:each) { sign_in_user(user) }

    scenario "has goals" do

      visit "/users/#{user.id}"
      expect(page).to have_content("Get more sleep!!")
    end

    scenario "can create goal" do
      visit "/users/#{user.id}"
      click_on "New goal"
      expect(page).to have_content("Add a new goal")
    end

    scenario "new goal appears on user page" do
      visit "/users/#{user.id}"
      click_on "New goal"
      fill_in 'Goal', with: "Pass the assessment!"
      click_on 'Create goal'

      expect(page).to have_content("Pass the assessment!")
    end
  end
end
