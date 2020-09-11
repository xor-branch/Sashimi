class Task < ApplicationRecord
  default_scope { order(created_at: :desc) }
  validates :name, presence:true, null:false,length:{maximum:60}
  validates :content, presence:true, null:false
end
