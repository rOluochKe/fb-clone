require 'rails_helper'

RSpec.feature "User logins and logouts", type: :feature do

  scenario "sign in user with correct user details" do
    visit  new_user_session_path
    user = FactoryBot.create(:user, email: "john@gmail.com", password: "1234567")
    login(user)
    expect(page).to have_content("Signed in successfully.")
    expect(current_path).to eq(current_path)
  end

  scenario "Signing user with wrong details" do 
    visit new_user_session_path
    user = FactoryBot.build(:user,email:"fakeemail@fake.com",password:"nopasswordisright")
    login(user)
    expect(page).to have_content("Invalid Email or password.")
    expect(current_path).to eq(new_user_session_path)
  end

  private

  def login(user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
  end
end