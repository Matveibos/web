class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.text :content

      t.timestamps
    end
  end
end
