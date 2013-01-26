class CreateAuthours < ActiveRecord::Migration
  def change
    create_table :authours do |t|

      t.timestamps
    end
  end
end
