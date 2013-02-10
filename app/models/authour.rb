class Authour < ActiveRecord::Base
   attr_accessible :name
   has_many :posts

#   def name
#     '#{authour_name}'
#   end

end
