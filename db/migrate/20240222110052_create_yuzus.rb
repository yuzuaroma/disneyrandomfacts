class CreateYuzus < ActiveRecord::Migration[6.1]
  def change
    create_table :yuzus do |t|
      t.string :title
      t.string :image
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
