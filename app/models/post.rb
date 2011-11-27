class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :category_id, :presence => true

  default_scope order("created_at DESC")
end
