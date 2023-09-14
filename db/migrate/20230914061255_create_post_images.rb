class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t| #Railsの命名規則によりモデル名をキャメルケースで記載すると単語の組み合わせと判断され間に「_」が自動設定される。

      t.string :shop_name
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
