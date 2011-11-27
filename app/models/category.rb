class Category < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  belongs_to :user
  
  attr_accessible :name, :description
  validates :name, :presence => true,
                   :uniqueness => true
  validates :user_id, :presence => true

  default_scope order("created_at DESC")
end
