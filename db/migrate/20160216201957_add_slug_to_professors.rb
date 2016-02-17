class AddSlugToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :slug, :string
    add_index :professors, :slug, unique: true
  end
end
