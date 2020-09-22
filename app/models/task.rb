class Task < ApplicationRecord
  validates :name, presence:true, null:false,length:{maximum:60}
  validates :content, presence:true, null:false
  validates :end_time, presence:true, null:false
 #serach
  enum statut: %i[not_started started completed]
  enum priority: %i[low medium high]
  scope :name_search,  -> (text_serach) {where("name LIKE ?", "%#{text_serach}%")}
  scope :status_search,  -> (text_serach) {where(status: text_serach)}
#post
  belongs_to :user
#Labelling
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
