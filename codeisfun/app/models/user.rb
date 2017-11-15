class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  has_many :comments
  has_many :problems
  validates_uniqueness_of :username

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "avatar_2x.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  has_many :solutions

  before_validation :assign_role


  def assign_role
    self.role = Role.find_by_name("Member") if self.role.nil?
  end

  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end

  def member?
    self.role.name == "Member" if !self.role.blank?
  end

end
