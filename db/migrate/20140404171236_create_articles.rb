class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :summary
      t.string :thumbnail
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
