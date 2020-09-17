require 'rails_helper'
RSpec.describe 'User registration, login and logout functions', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:admin_user)
  end

  describe 'Testing User Registration' do
    context 'If the user has no data and is not logged in' do
      it 'Testing New User Registration' do
        visit new_user_path
        fill_in 'user[name]', with: 'user2'
        fill_in 'user[email]', with: 'user2@gmail.com'
        fill_in 'user[password]', with: '000000'
        fill_in 'user[password_confirmation]', with: '000000'
        click_button 'Create User'
        expect(page).to have_content 'user2'
        expect(page).to have_content 'user2@gmail.com'
      end
      it 'Test to jump to the login screen when you are not logged in' do
        visit root_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe 'Testing the Session Functionality' do
    context 'If the user has no data and is not logged in' do
      it 'Testing Session Logins' do
        visit new_session_path
        fill_in 'session[email]', with: 'user@gmail.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        expect(page).to have_content 'user@gmail.com'
      end
      it 'A test that takes you to a task list page when you go to someone elses My Page' do
        visit new_session_path
        fill_in 'session[email]', with: 'user@gmail.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        visit user_path(@admin_user.id)
        expect(current_path).to eq root_path
      end
    end
    context 'If the user is logged in' do
      it 'Testing Session Logouts' do
        visit new_session_path
        fill_in 'session[email]', with: 'user@gmail.com'
        fill_in 'session[password]', with: 'user@gmail.com'
        click_button 'Log in'
        click_link 'logout'
        expect(current_path).to eq new_session_path
        expect(page).to have_content 'good bye'
      end
    end
  end

  describe 'Administration Test' do
    context 'With an administrator.' do
      it 'Testing that gives administrators access to the admin panel' do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@gamil.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        visit admin_users_path
        expect(page).to have_selector 'a', text: 'users list'
      end
      it "Tested that general users can't access the admin panel" do
        visit new_session_path
        fill_in 'session[email]', with: 'user@gmail.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        visit admin_users_path
        expect(page).to have_content 'you are already logged'
      end
      it 'Testing that allows administrators to register new users' do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@gmail.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        visit new_admin_user_path
        fill_in 'user[name]', with: 'test3'
        fill_in 'user[email]', with: 'test3@gmail.com'
        fill_in 'user[password]', with: 'bbbbbb'
        fill_in 'user[password_confirmation]', with: 'bbbbbb'
        click_button 'Create User'
        expect(current_path).to eq admin_users_path
        expect(page).to have_content'test3'
      end
      it "Testing that gives administrators access to the user's details" do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@gmail.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        visit admin_user_path(@admin_user.id)
        expect(page).to have_content 'admin'
        expect(page).to have_content 'admin@example.com'
      end
      it "Testing that allows administrators to edit users from the user's edit screen" do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@gmail.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        visit edit_admin_user_path(@user.id)
        fill_in 'user[name]', with: 'test1'
        fill_in 'user[email]', with: 'test1@example.com'
        fill_in 'user[password]', with: '111111'
        click_button 'Update User'
        expect(page).to have_content 'test1'
      end
      it 'Testing that allows administrators to delete users.' do
        visit new_session_path
        fill_in 'session[email]', with: 'admin@example.com'
        fill_in 'session[password]', with: '000000'
        click_button 'Log in'
        visit admin_users_path
        page.accept_confirm do
          click_on 'Destroy', match: :first
        end
        expect(page).to have_content 'user are successfully destroy'
      end
    end
  end
end
