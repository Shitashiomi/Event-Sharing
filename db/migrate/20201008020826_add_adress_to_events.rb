class AddAdressToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :address, :string
  end
end
