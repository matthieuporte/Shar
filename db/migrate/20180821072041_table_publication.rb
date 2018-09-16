class TablePublication < ActiveRecord::Migration[5.2]
  def change
    create_table :publications
    add_column :publications, :auteur_id, :integer
    add_index :publications, :auteur_id
    add_column :publications, :auteur, :string
    add_column :publications, :titre, :string
    add_column :publications, :contenu, :text
    add_column :publications, :date, :datetime
    add_column :publications, :likes, :integer
  end
end
