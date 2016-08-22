FactoryGirl.define do

  factory :engine_type do
    code "MyString"
    description "MyString"
  end
  
  factory :user do
    id 1
    firstname "Neeraj"
    lastname "Kumar"
    username "neeraj"
    email "neeraj.kumar@gmail.com"
  end

  factory :reader do
    id 1
    firstname "Neeraj"
    lastname "Kumar"
    username "neeraj"
    email "neeraj.kumar@gmail.com"
  end

  factory :price do
    id 1
    cost "100.00"
  end

  factory :book do
    title "Title1"
    association :user, strategy: :build
    association :reader, strategy: :build
  end

  factory :friend do
    firstname "Anurag"
    lastname "Saxena"
  end

  factory :friendship do
    association :friend, strategy: :build
    association :user, strategy: :build
  end

end
