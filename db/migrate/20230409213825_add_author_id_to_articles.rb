class AddAuthorIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles, :author, index: true, foreign_key: true
  end
end
