#bundle exec rspec spec/system/label_spec.rb

require 'rails_helper'
require 'selenium-webdriver'
RSpec.describe 'label Management Function', type: :system do
  before do
    @user =FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)

    @label1 = FactoryBot.create(:label1, user:@user)
    @label2 = FactoryBot.create(:label2, user:@user)

    FactoryBot.create(:task, user: @user)
    FactoryBot.create(:second_task, user: @user)

    visit new_session_path
    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_button 'Log in'
  end

  describe 'Label managing' do
    context 'If the label is not registered' do
      it 'regritre Labels in Tasks' do
        visit new_task_path
        fill_in 'task_name', with: 'task1'
        fill_in 'task_content', with: 'content1'
        select 'low', from: 'task_priority'
        select 'not_started', from: 'task_statut'
        #binding.irb
        find(:css, "#task_label_ids_1[value='1']").set(true)
        click_on 'Create Task'

        expect(page).to have_content 'label1'
      end
      it 'Registe Multiple Labels in a Task' do
        visit new_task_path
        fill_in 'task_name', with: 'task1'
        fill_in 'task_content', with: 'content1'
        select 'medium', from: 'task_priority'
        select 'started', from: 'task_statut'

        find(:css, "#task_label_ids_3[value='3']").set(true)
        find(:css, "#task_label_ids_4[value='4']").set(true)

        click_on 'Create Task'
        expect(page).to have_content 'label1'
        expect(page).to have_content 'label2'
      end
    end
    context `If the task list is not sorted` do
      it 'Tasks can be searched by label.' do
          visit tasks_path
          select 'label1', from: 'label_id'
          click_button 'Search'
          expect(page).to have_content 'label1'
      end
    end
  end
end
