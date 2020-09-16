FactoryBot.define do
 factory :task do
   name { 'Task1' }
   content { 'content1' }
   end_time { '2020-05-01' }
   priority { 'high' }
   statut { 'completed' }
 end
 factory :second_task, class: Task do
   name { 'Task2' }
   content { 'content2' }
   end_time { '2020-05-02' }
   priority { 'medium' }
   statut { 'completed' }
 end
end
