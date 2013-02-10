class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
 attr_accessible :commenter, :post_id, :content
 belongs_to :post
end
