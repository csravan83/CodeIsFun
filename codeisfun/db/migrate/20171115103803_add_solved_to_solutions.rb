class AddSolvedToSolutions < ActiveRecord::Migration[5.1]
  def change
    add_column :solutions, :solved, :boolean, default: false
  end
end
