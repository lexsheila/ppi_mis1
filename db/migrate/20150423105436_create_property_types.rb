class CreatePropertyTypes < ActiveRecord::Migration
  def change
    create_table :property_types do |t|
    	t.string :code 
		t.string :description

      t.timestamps null: false
    end
  end
end
