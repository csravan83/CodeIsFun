class Quotation < ApplicationRecord
  validates_presence_of :author_name 
  validates_presence_of :category
  validates_presence_of :quote


  def self.search(search)
    # where(' author_name ILIKE ? OR quote ILIKE ? AND id NOT IN (?)', "%#{search}%", "%#{search}%" , list )
    where('author_name ILIKE ? OR quote ILIKE ?', "%#{search}%", "%#{search}%")
  end

end
