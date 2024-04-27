class AddReferencesToPostsTable < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    add_reference :posts, :father_post, foreign_key: {to_table: :posts} 
    # father_post_id sera el atributo que indicara el id del post al q se le esta respondiendo
    # puede ser null, ya que puede ser un post hecho en respuesta a nadie!!
  end
end
