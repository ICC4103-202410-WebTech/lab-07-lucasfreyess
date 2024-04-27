class CreatePostTagTable < ActiveRecord::Migration[7.1]
  def change
    create_table :post_tags do |t|
      #viene vacia, ya que es preferible agregar las referencias en otra migracion

      t.timestamps
    end
  end
end
