require 'rails_helper'
#bundle exec rspec spec/system/task_spec.rb

RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        #creer un enregistrement avec factory
        task = FactoryBot.create(:task, name:'task', content:'content')
        #après la création rediriger vers l'index
        visit tasks_path
        expect(page).to have_content 'task'
      end
    end
    context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
        task = FactoryBot.create(:task, name:'title1', content:'content1')
        task = FactoryBot.create(:task, name:'title2', content:'content2')
        visit tasks_path
        task_list = all('.task_list')
        expect(task_list[0]).to have_content 'title2'
        expect(task_list[1]).to have_content 'title1'
        #expect(page).to have_content 'task'
      end
   end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        task = FactoryBot.create(:task, name:'task', content:'content')
        #après la création rediriger vers l'index
        visit tasks_path
        #binding.irb
        current_path
        Task.count
        page.html
        expect(page).to have_content 'task'
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
         visit tasks_path
         click_on 'task'
         expect(page).to have_content 'task'
       end
     end
  end
end
