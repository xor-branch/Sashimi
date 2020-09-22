#bundle exec rspec spec/system/task_spec.rb

require 'rails_helper'
require 'selenium-webdriver'
RSpec.describe 'Task Management Function', type: :system do
  before do
    @user =FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)

    @task1 = FactoryBot.create(:task, user:@user)
    @task2 = FactoryBot.create(:second_task, user:@user)

    visit new_session_path
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_button 'Log in'
  end

  describe 'Reordering by Priority' do
    context 'If you clicked on Sort by Priority' do
      it 'They are listed in order of priority.' do
        visit tasks_path
        click_on 'priority'
          task_list = all('.priority_high')
          expect(page).to have_content 'high'
          expect(page).to have_content 'medium'
          #binding.irb
        end
      end
    end

  describe 'search function' do
    context 'If you search by name' do
      it 'You can search by name.' do
        visit tasks_path
        fill_in "name", with: 'Task1'
        select "completed", from: 'statut'
        click_button 'search'
        expect(page).to have_content 'Task1'
      end
    end

    context 'If you search by statut' do
      it 'You can search by statut.' do
        visit tasks_path
        select "completed", from: 'statut'
        click_button 'search'
        expect(page).to have_content 'completed'
      end
    end

    context 'If you search by title and statut' do
    it 'You can search by title and statut.' do
        visit tasks_path
        fill_in "name", with: 'Task1'
        select "completed", from: 'statut'
        click_button 'search'
        expect(page).to have_content 'Task1'
        expect(page).to have_content 'completed'
      end
    end
  end

  describe 'Reordering by End time' do
    context 'If you enter the end time and press the create button' do
      it 'Data is stored.' do
        visit new_task_path
        select '2020', from: 'task_end_time_1i'
        select 'May', from: 'task_end_time_2i'
        select '1', from: 'task_end_time_3i'
        click_on 'commit'
        expect(page).to have_content '2020'
        expect(page).to have_content 'May'
        expect(page).to have_content '1'
      end
    end

    context 'If you click on Sort by end time' do
      it 'Tasks are arranged in descending order by end time' do

        visit tasks_path
        click_on 'deadline'
        task_list = all('.tbody tr')
        expect(page).to have_content 'Task2'
        expect(page).to have_content 'Task1'
      end
    end
    context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
        #task = FactoryBot.create(:task, name:'title1', content:'content1')
        #task = FactoryBot.create(:task, name:'title2', content:'content2')
        visit tasks_path
        task_list = all('.task_list')
        expect(page).to have_content 'Task2'
        expect(page).to have_content 'Task1'
        #expect(page).to have_content 'task'
      end
   end
  end

  describe 'Task List screen' do
    context 'If you create a task' do
      it 'Displays the tasks you have already created'do
        visit tasks_path
        expect(page).to have_content 'Task1'
      end
    end

    context 'If you create multiple tasks' do
      it 'Tasks are arranged in descending order of creation date' do
        visit tasks_path
        task_list = all('.task_list')
        expect(page).to have_content 'Task2'
        expect(page).to have_content 'Task1'
      end
    end
  end
  describe 'Task registration screen' do
    context 'When you fill in the required fields and press the create button' do
      it 'Data is stored.' do
        visit new_task_path
        fill_in 'task_name', with: 'Task1'
        fill_in 'task_content', with: 'content1'
        select 'high', from: 'task_priority'
        select 'completed', from: 'task_statut'
        click_on 'commit'
        expect(page).to have_content 'Task1'
        expect(page).to have_content 'content1'
      end
    end
  end
  describe 'Task Details Screen' do
    context 'When you move to any task detail screen' do
      it 'You will be redirected to a page with the content of the relevant task.' do
        @task1 = FactoryBot.create(:task, user:@user)
        visit task_path(@task1.id)
        expect(page).to have_content 'Task1'
        expect(page).to have_content 'content1'
      end
    end
  end
end
