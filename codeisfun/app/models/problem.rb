class Problem < ApplicationRecord
  belongs_to :category
  has_many :comments

  has_paper_trail
end
