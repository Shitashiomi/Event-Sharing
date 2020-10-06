class CreateInquities < ActiveRecord::Migration[5.2]
  def change
    create_table :inquities do |t|
      t.string :inquity_name
      t.string :inquity_email
      t.text :message

      t.timestamps
    end
  end
end
