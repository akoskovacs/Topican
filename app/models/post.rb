class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :content, :presence => true

  default_scope order("created_at DESC")
end
