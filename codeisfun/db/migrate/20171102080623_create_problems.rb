class CreateProblems < ActiveRecord::Migration[5.1]
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.text :input
      t.text :output
      t.text :TC1
      t.text :TC2
      t.text :TC3
      t.string :status
      t.string :author
      t.string :category_id

      t.timestamps
    end
  end
end
