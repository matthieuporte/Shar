class TableFollows < ActiveRecord::Migration[5.2]
  def change
  	create_table :follows
  	add_column :follows, :id_follower, :integer
  	add_column :follows, :id_followed, :integer
  end
end
