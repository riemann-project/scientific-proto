# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :problem_tree do
    problem 1
    university "MyString"
    department "MyString"
    course "MyString"
    grade 1
    name "MyString"
    date "2012-05-24"
  end
end
