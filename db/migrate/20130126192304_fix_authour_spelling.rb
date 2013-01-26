class FixAuthourSpelling < ActiveRecord::Migration
  def change
    rename_column :posts, :author_id, :authour_id
  end
end
