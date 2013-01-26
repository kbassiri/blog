class CreatePosts < ActiveRecord::Migration
def change
    create_table :post do |t|
      t.string :title
      t.references :author   #this is equivalent to author_id
      t.text :content
      t.timestamps
    end
end

end
