class AddVerificationToRequests < ActiveRecord::Migration
  def up
  	add_column :requests, :verification_code, :string
  end

  def down
  	remove_column :requests, :verification_code
  end
end
