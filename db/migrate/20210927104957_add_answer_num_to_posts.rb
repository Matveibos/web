class AddAnswerNumToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :answer_num, :string
    add_column :posts, :answer_rus, :string
    add_column :posts, :answer_eng, :string
  end
end
