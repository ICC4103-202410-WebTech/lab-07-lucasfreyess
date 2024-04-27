class AddReferencesToPostJoinTagTable < ActiveRecord::Migration[7.1]
  def change
    add_reference :post_tags, :post, null: false, foreign_key: true
    add_reference :post_tags, :tag, null: false, foreign_key: true
    
  end
end
