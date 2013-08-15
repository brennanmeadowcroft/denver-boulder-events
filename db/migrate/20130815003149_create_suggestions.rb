class CreateSuggestions < ActiveRecord::Migration
  def up
    create_table :suggestions do |t|
      t.string :email
      t.string :name
      t.text :content
      t.timestamps
    end
  end

  def down
  	drop_table :suggestions
  end
end
