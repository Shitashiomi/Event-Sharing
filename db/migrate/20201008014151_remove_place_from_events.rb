class RemovePlaceFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :place, :string
  end
end
