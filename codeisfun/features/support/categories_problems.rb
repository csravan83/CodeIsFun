
FactoryGirl.define do
  factory :category, class: Category do
    name "Algorithm"
  end


  factory :problem, class: Problem do
    title "Problem1"
    description "test"
    input "1"
    output "1"
    TC1 "11"
    TC2 "22"
    TC3 "33"
    status "Basic"
    author "admin"
    category_id "1"
    category {Category.find_by_name("Algorithm")}
    user_id {User.find_by_id("3")}
  end
end