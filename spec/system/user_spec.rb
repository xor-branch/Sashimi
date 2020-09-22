#bundle exec rspec spec/system/user_spec.rb

require 'rails_helper'
RSpec.describe 'User registration, login and logout functions', type: :system do
  before do
    @user =FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)
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
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe 'Testing the Session Functionality' do
    context 'If the user has no data and is not logged in' do
      it 'Testing Session Logins' do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_button 'Log in'
        expect(page).to have_content 'user@gmail.com'
      end
      it 'When you are logged do not go to the user registration screen' do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_button 'Log in'
        visit new_user_path
        expect(current_path).to eq user_path(@user.id)
        expect(page).to have_content 'you are already logged'
      end
      it 'A test that takes you to a task list page when you go to someone elses My Page' do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_button 'Log in'
        visit admin_users_path
        expect(current_path).to eq user_path(@user.id)
        expect(page).to have_content 'you are already logged'
      end
    end
    context 'If the user is logged in' do
      it 'Testing Session Logouts' do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_button 'Log in'
        #click_link 'logout'
        page.accept_confirm do
          click_link 'logout'
        end
        #expect(current_path).to eq new_session_path
        expect(page).to have_content 'good bye'
      end
    end
  end

  describe 'Administration Test' do
    context 'With an administrator.' do
      it 'Testing that gives administrators access to the admin panel' do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_button 'Log in'
        visit admin_users_path
        expect(page).to have_selector 'a', text: 'users list'
      end
      it "Tested that general users can't access the admin panel" do
        visit new_session_path
        fill_in 'session[email]', with: @user.email
        fill_in 'session[password]', with: @user.password
        click_button 'Log in'
        visit admin_users_path
        expect(page).to have_content 'you are already logged'
      end
      it 'Testing that allows administrators to register new users' do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
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
      it 'get error if register the same email address for 2 users' do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_button 'Log in'
        visit new_admin_user_path
        fill_in 'user[name]', with: 'user'
        fill_in 'user[email]', with: 'user@gmail.com'
        fill_in 'user[password]', with: '000000'
        fill_in 'user[password_confirmation]', with: '000000'
        click_button 'Create User'
        expect { raise StandardError, 'Email has already been taken'}.to raise_error('Email has already been taken')
      end
      it "Testing that gives administrators access to the user's details" do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_button 'Log in'
        visit admin_users_path
        expect(page).to have_content 'admin'
        expect(page).to have_content 'admin@gmail.com'
      end
      it "Testing that allows administrators to edit users from the user's edit screen" do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_button 'Log in'
        visit edit_admin_user_path(@user.id)
        fill_in 'user[name]', with: 'user1'
        fill_in 'user[email]', with: 'user1@gmail.com'
        fill_in 'user[password]', with: '111111'
        fill_in 'user[password_confirmation]', with: '111111'
        click_button 'Update User'
        expect(page).to have_content 'user1'
      end
      it 'Testing delete self admin.' do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_button 'Log in'
        visit admin_users_path
        page.accept_confirm do
          click_on 'destroy', match: :first
        end
        expect(page).to have_content 'you are currently the only administrator. Please choose another administrator before'
      end
      it 'Testing update role self admin.' do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_button 'Log in'
        visit edit_admin_user_path(@admin_user.id)
        #binding.irb
        find(:css, "#user_admin[value='true']").set(false)
        fill_in 'user[password]', with: '000000'
        fill_in 'user[password_confirmation]', with: '000000'
        click_button 'Update User'
        expect(page).to have_content 'true'
      end
      it 'Testing that allows administrators to delete users.' do
        visit new_session_path
        fill_in 'session[email]', with: @admin_user.email
        fill_in 'session[password]', with: @admin_user.password
        click_button 'Log in'
        visit admin_users_path
        page.accept_confirm do
          click_on 'destroy', match: :first
        end
        expect(page).to have_content 'you are currently the only administrator. Please choose another administrator before'
      end
    end
  end
end
