class AddGenreToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :genre, :integer
  end
end
