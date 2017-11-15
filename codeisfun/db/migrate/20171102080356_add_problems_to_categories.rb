class AddProblemsToCategories < ActiveRecord::Migration[5.1]
  def change
    add_reference :categories, :category, foreign_key: true
  end
end
