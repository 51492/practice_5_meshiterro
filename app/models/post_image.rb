class PostImage < ApplicationRecord

  has_one_attached :image #AcriveStorageを使って画像を持たせるための記述
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  # dependent: :destroyはhas_manyで使えるオプション。1:Nの関係で1側のデータが削除されたら関連するNのデータもすべて削除される設定

  def get_image
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    image
  end

end
