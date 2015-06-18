class CreateInsuranceFirms < ActiveRecord::Migration
  def change
    create_table :insurance_firms do |t|
    	t.string  :company_name  
		t.integer :TIN_NUMBER
		t.integer :VAT_NUMBER
		t.string  :physical_address
		t.string  :postal_address
		t.string  :contact_person
		t.integer :primary_phone_number
		t.integer :other_phone_number
		t.integer :fax
		t.string  :email
		t.string  :specialization
		t.string  :legrep_first_name
		t.string  :legrep_last_name
		t.string  :address
		t.integer :pri_phone_num
		t.integer :other_phone_num
		t.string  :rep_email
		t.string  :remarks
	    

      	t.timestamps null: false
    end
  end
end
