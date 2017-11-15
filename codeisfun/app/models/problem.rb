class Problem < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments

  has_paper_trail
end
