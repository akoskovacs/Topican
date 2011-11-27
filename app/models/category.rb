class Category < ActiveRecord::Base
  has_many :posts
  belongs_to :user

  validates :name, :presence => true,
                   :uniqueness => true
  validates :user_id, :presence => true
end
