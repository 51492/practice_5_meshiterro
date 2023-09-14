class PostImage < ApplicationRecord

  has_one_attached :image #AcriveStorageを使って画像を持たせるための記述
  belongs_to :user

end
