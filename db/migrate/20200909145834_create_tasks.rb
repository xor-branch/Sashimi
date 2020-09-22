class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, precence:true, null:false ,uniqueness: true, length:{ maximum:60 }
      t.text :content,precence:true,null:false
      t.date :end_time, precence:true, null:false
      t.timestamps
    end
  end
end
