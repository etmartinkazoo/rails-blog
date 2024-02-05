class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.boolean :draft, default: true
      t.date :publishedOn, null: false
      t.timestamps
    end
  end
end
