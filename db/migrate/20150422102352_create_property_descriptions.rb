class CreatePropertyDescriptions < ActiveRecord::Migration
  def change
    create_table :property_descriptions do |t|
    	t.string :code 
		t.string :description

      t.timestamps null: false
    end
  end
end
