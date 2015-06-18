class CreateInsurancePremiums < ActiveRecord::Migration
  def change
    create_table :insurance_premiums do |t|
    	t.string  :insurance_firm  
		t.integer :premium_amount
		t.float   :premium_percentage
		t.string  :remarks
      
    end
  end
end
