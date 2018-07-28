class AddBookBodyToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_body, :text
  end
end
