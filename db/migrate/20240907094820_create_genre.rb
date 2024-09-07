class CreateGenre < ActiveRecord::Migration[7.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps
    end

    create_table :book_genres do |t|
      t.belongs_to :book
      t.belongs_to :genre
      t.string :genre_type
    end

    remove_column :books, :genre
  end

end
