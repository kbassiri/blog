class AddAuthourNameColumn < ActiveRecord::Migration
  def change
    add_column  :authours, :name,   :string
  end
end
