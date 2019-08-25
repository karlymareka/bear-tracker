class CreateRangers < ActiveRecord::Migration[5.1]
  def change
   create_table :rangers do |t|
     t.string :name
     t.string :username
     t.string :password_digest
     t.integer :park_id 
   end
 end
end
