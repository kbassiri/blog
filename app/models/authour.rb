class Authour < ActiveRecord::Base
  # attr_accessible :title, :body
   has_many posts
end