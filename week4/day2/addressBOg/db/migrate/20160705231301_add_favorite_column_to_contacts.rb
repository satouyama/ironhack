class AddFavoriteColumnToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :Contacts, :favorite, :boolean
  end
end
