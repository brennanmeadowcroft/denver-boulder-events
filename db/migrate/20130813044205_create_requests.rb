class CreateRequests < ActiveRecord::Migration
  def up
    create_table :requests do |t|
      t.string :email
      t.binary :approved
      t.binary :validated

      t.timestamps
    end

    def down
    	drop table :requests
    end
  end
end
