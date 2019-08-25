class CreateBears < ActiveRecord::Migration[5.1]
  def change
   create_table :bears do |t|
     t.string :name
     t.string :sex
     t.integer :age
     t.string :health_status
     t.string :habituation_status
     t.integer :ranger_id 
   end
 end
end
