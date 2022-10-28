class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      # 税抜価格
      t.integer :unit_price, null: false
      # 販売ステータス,uniqueはユニーク制約&カラムに独自性を与える
      # true=>販売中、false=>売切れ とする
      t.boolean :is_on_sale,null: false, unique: true
      t.timestamps
    end
  end
end
