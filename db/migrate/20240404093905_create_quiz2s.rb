class CreateQuiz2s < ActiveRecord::Migration[6.1]
  def change
    create_table :quiz2s do |t|
      t.string :question

      t.timestamps
    end
  end
end
