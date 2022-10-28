class Address < ApplicationRecord

  belongs_to :customer

  validates :postcode, presence: true , length: { maximum: 7 }
  validates :address, presence: true , length: { maximum: 161 }
  validates :name, presence: true , length: { maximum: 60 }

# 下記が必要なのか不明わかるまでコメントアウト
  # def address_display
  # '〒' + postcode + ' ' + address + ' ' + name
  # end

end
