class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :item_image

  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
  end
  
  # 消費税計算用メソッド
  # 1.08とは8%のこと。round」を使って、小数点を切り上げ。
  def add_tax_price
    (self.unit_price * 1.08).round
  end
end
