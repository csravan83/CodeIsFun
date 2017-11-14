class Problem < ApplicationRecord
  belongs_to :category
  has_many :comments
  has_many :solutions
  has_paper_trail
end
