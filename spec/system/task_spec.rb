require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        #creer un enregistrement avec factory
        #task = FactoryBot.create(:task, name:'task', content:'content')
        #après la création rediriger vers l'index

        visit new_task_path
        fill_in 'task_name', with:'name2'
        fill_in 'task_content', with:'content2'
        select '2017', from: 'task_end_time_1i'
        select 'January', from: 'task_end_time_2i'
        select '10', from: 'task_end_time_3i'
        click_on 'commit'
        binding.irb
        visit tasks_path
        expect(page).to have_content '2017'
        expect(page).to have_content '1'
        expect(page).to have_content '5'
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
