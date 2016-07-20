class AddUserReferenceToComics < ActiveRecord::Migration[5.0]
  def change
    add_reference :comics, :user, foreign_key: true
  end
end
