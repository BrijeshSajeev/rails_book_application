class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :year
      t.text :genre
      t.string :price

      t.timestamps
    end
  end
end
