class Task < ApplicationRecord
  validates :name, presence:true, null:false,length:{maximum:60}
  validates :content, presence:true, null:false
end
