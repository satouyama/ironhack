class FixNumberTypeInContacts < ActiveRecord::Migration[5.0]
  def change
    change_column :Contacts, :number, :string
  end
end
