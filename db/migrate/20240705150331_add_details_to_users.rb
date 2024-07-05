class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :age, :integer
    add_column :users, :sex, :string
    add_column :users, :interests, :text
  end
end
