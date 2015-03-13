class CreateRegisteredUsers < ActiveRecord::Migration
  def change
    create_table :registered_users do |t|
    t.string :first_name
	t.string :last_name
	t.string :username
	t.string :email

    t.timestamps null: false
    end
  end
end
