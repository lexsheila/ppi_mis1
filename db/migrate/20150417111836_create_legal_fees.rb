class CreateLegalFees < ActiveRecord::Migration
  def change
    create_table :legal_fees do |t|
    	t.string  :law_firm  
		t.integer :fees_amount
		t.float   :fees_percentage
		t.string  :remarks
      
    end
  end
end
