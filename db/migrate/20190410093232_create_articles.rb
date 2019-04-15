class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :external_id
      t.string :title
      t.text :description
      t.integer :local_likes, default: 0
      t.integer :remote_likes, default: 0

      t.timestamps
      t.index :external_id
    end
  end
end
