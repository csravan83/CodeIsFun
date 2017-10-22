
FactoryGirl.define do

  factory :newuser , class: User do
    email "taylor@ait.ac.th"
    password "password"
    password_confirmation "password"
  end

  factory :olduser , class: User do
    email "wanlipa@ait.ac.th"
    password "password"
  end

end