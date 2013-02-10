class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :commenter
      t.references :post
      t.timestamps
    end
  end
end
