class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :content
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
