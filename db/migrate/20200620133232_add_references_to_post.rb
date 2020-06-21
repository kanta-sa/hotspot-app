class AddReferencesToPost < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :prefecture, foreign_key: true
    add_reference :posts, :city, foreign_key: true
  end
end
