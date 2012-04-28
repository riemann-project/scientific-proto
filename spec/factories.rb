# coding: utf-8

FactoryGirl.define do
  factory :user do
    id 1
    email "alice@alice.com"
    password "alicealice"
    interests { [Factory(:alices_interest)] }
    usefuls { [Factory(:alices_useful)] }
    badges { [Factory(:silver_badge)] }
    
    # Alice follows Bob
    follows { [Factory(:to_follow_bob)] }
  end
  
  factory :user_bob, class: User do
    id 2
    email "bob@bob.com"
    password "bobbob"
    
    # Bob follows Alice
    follows { [Factory(:to_follow_alice)] }
  end
  
  factory :problem do
    title "電磁気II 期末テスト 大問1"
    content "ガウスの法則を定性的に説明せよ"
    answers { [Factory(:answer)] }
  end
  
  factory :answer, class: Answer do
    id 1
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
  
  factory :alices_useful, class: Useful do
    reference_id 1
  end
  
  factory :gold_badge, class: Badge do
    name "Gold Badge"
  end
  
  factory :silver_badge, class: Badge do
    name "Silver Badge"
  end
  
  factory :to_follow_bob, class: Follow do
    followed_id 2
  end

  factory :to_follow_alice, class: Follow do
    followed_id 1
  end
end
