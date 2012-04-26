# coding: utf-8

FactoryGirl.define do
  factory :user do
    id 1
    email "alice@alice.com"
    password "alicealice"
    interests {[ Factory(:alices_interest)] }
  end
  
  factory :user_bob, class: User do
    id 2
    email "bob@bob.com"
    password "bobbob"
  end
  
  factory :problem do
    title "電磁気II 期末テスト 大問1"
    content "ガウスの法則を定性的に説明せよ"
    answers { [Factory(:answer)] }
  end
  
  factory :answer, class: Answer do
    content "電荷から電場が湧き出ていることをガウスの定理を用いて表現されている"
    discussions { [Factory(:super_discussion)] }
  end
  
  factory :super_discussion, class: Discussion do
    content "この回答は説明不足だと思います。微分形と積分形の違い、遠隔力・近接力について記述するべきです。"
    discussable_type "Answer"
    discussions { [Factory(:discussion)] }
  end
  
  factory :discussion do
    content "そうですね。どなたかこの点も含めて回答つくってくださいませんか。"
    discussable_type "Discussion"
  end
  
  factory :alices_interest, class: Interest do
    discussion_id 1
  end
end
