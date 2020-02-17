require 'rails_helper'

RSpec.feature "User can sign up", type: :feature do

  scenario "Sing up the user" do 
    visit new_user_registration_path
    user = FactoryBot.build(:user)
    sign_up(user)
     expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "Giving an already existed email" do 
    visit new_user_registration_path
    user = FactoryBot.create(:user)
    sign_up(user)
     expect(current_path).to eq(current_path)
    expect(page).to have_content("Email has already been taken")
  end


  private
  
  def sign_up(user)
    fill_in "Email",with: user.email
    fill_in "Name",with: user.name
    fill_in "Password",with: user.password
    fill_in "Password confirmation",with: user.password
    click_button "Sign up"
  end
end