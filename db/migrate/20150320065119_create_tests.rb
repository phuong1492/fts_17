class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :user_id
      t.integer :lesson_id
      t.integer :answer_id
      t.integer :mark
      t.string :status

      t.timestamps null: false
    end
  end
end
