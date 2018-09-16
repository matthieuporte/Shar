class TableMessages < ActiveRecord::Migration[5.2]
  def change
  	create_table :messages
  	add_column :messages, :id_auteur, :integer
  	add_column :messages, :id_destinataire, :integer
  	add_column :messages, :contenu, :text
  	add_column :messages, :date, :datetime
  end
end
