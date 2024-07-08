class AddImageToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :image, :string
  end
end
