class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :content, :presence => true
end
