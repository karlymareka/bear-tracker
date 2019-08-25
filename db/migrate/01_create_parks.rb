class CreateParks < ActiveRecord::Migration[5.1]
  def change
   create_table :parks do |t|
     t.string :name
     t.string :state
   end
   Park.create(name: 'Yellowstone National Park', state: 'Wyoming')
   Park.create(name: 'Glacier National Park', state: 'Montana')
   Park.create(name: 'North Cascades National Park', state: 'Washington')
 end
end
