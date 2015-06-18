class CreatePropertyIdentifications < ActiveRecord::Migration
  def change
    create_table :property_identifications do |t|
    	t.string  :customer_code  
		t.integer :customer
		t.integer :tenure_system
		t.string  :LRV
		t.string  :folio
		t.date    :lease_effective_date
		t.date    :lease_expiry_date
		t.integer :lease_tenor
		t.integer :outstanding_lease_tenor
		t.integer :unit
		t.integer :flat
		t.integer :block
		t.integer :plot
		t.string  :road_location
		t.integer :area
		t.integer :district
		t.string  :county
		t.string  :sub_county
		t.string  :parish	
		t.string  :LC
		t.decimal :land_area_hectares
		t.decimal :land_area_acres
		t.decimal :built_area
		t.string  :property_description
		t.integer :number_of_units
		t.string  :property_type
		t.integer :number_of_bedrooms
		t.integer :property_status
		t.string  :roof_type
		t.string  :additional_description

      t.timestamps null: false
    end
  end
end


