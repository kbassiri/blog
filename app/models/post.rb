class Post < ActiveRecord::Base
  attr_accessible :title, :content, :authour_id
  belongs_to :authour
  has_many :comments

  #default_scope order('id DESC')
  default_scope order('title DESC')
end
