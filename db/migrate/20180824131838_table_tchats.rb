class TableTchats < ActiveRecord::Migration[5.2]
  def change
      create_table :tchats
      add_column :tchats, :auteur_id, :integer
      add_index :tchats, :auteur_id
      add_column :tchats, :auteur, :string
      add_column :tchats, :contenu, :string
  end
end
