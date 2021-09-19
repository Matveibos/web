class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :identificate
      t.string :name_in_network
      t.string :network
      t.string :status
      t.timestamps
    end
  end
end
