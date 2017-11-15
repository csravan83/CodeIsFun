class Category < ApplicationRecord
  has_many :problems
  has_paper_trail
  # accepts_nested_attributes_for :problems
end
