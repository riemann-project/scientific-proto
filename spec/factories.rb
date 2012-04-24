# coding: utf-8

FactoryGirl.define do
  factory :user1, class: User do
    email "alice@alice.com"
    password "alicealice"
  end
  
  factory :user2, class: User do
    email "bob@bob.com"
    password "bobbob"
  end
  
  factory :problem, class: Problem do
    title "電磁気II 期末テスト 大問1"
    content "ガウスの法則を定性的に説明せよ"
    # answers {
    #   ["電場と電荷の関係を表す方程式である。
    #   電気力線の本数(電場の強さ)が空間的に変化している点があれば、そこに電荷が存在することを示している。"]
    # }
  end
end
