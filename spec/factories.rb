# coding: utf-8

FactoryGirl.define do
  factory :user do
    id 1
    name "Alice"
    email "alice@alice.com"
    password "alicealice"
    problems {[Factory(:problem)]}
    # interests { [Factory(:alices_interest)] }
    # usefuls { [Factory(:alices_useful)] }
    badges { [Factory(:silver_badge)] }
    
    # Alice follows Bob
    follows { [Factory(:to_follow_bob)] }
  end
  
  factory :user_bob, class: User do
    id 2
    name "Bob"
    email "bob@bob.com"
    password "bobbob"
    
    # Bob follows Alice
    # follows { [Factory(:to_follow_alice)] }
  end
  
  factory :problem do
    title "電磁気II 期末テスト 大問1"
    content "ガウスの法則を定性的に説明せよ"
    answers { [Factory(:answer)] }
    references {[Factory(:reference)]}
    tag_list {["電磁気", "ガウスの定理"]}
  end
  
  factory :answer, class: Answer do
    id 1
    content "電荷から電場が湧き出ていることをガウスの定理を用いて表現されている。
    $$ \\sum_{n=1}^\\infty \\frac{1}{n^2} = \\frac{\\pi^2}{6} $$"
    discussions { [Factory(:super_discussion)] }
  end
  
  factory :super_discussion, class: Discussion do
    title "回答不足ではないですか"
    content "この回答は説明不足だと思います。微分形と積分形の違い、遠隔力・近接力について記述するべきです。"
    user_id 1
    discussable_type "Answer"
    discussions { [Factory(:discussion)] }
  end
  
  factory :discussion do
    title "discussion title"
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
  
  factory :reference do
    user_id 1
    content "this is the reference."
    usefuls {[Factory(:alices_useful)]}
  end
end
