class Task < ApplicationRecord
  default_scope { order(created_at: :desc) }
  validates :name, presence:true, null:false,length:{maximum:60}
  validates :content, presence:true, null:false
  validates :end_time, presence:true, null:false

  enum statut: %i[not_started started completed]
  enum priority: %i[high medium low]

end
