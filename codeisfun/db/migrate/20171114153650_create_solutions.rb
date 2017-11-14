class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.references :user, foreign_key: true
      t.references :problem, foreign_key: true

      t.timestamps
    end
  end
end
