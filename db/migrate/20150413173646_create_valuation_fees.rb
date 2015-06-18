class CreateValuationFees < ActiveRecord::Migration
  def change
  	create_table :valuation_fees do |t|
	t.string  :valuer  
	t.integer :fees_amount
	t.float   :fees_percentage
	t.string  :remarks
	 end
  end
end
