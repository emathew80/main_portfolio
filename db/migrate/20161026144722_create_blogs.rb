class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|

      t.string :title
      t.text :post
      

      t.integer :blog_id
      t.string :cover_photo

      t.timestamps
    end
  end
end
