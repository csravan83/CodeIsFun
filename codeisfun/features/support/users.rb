
FactoryGirl.define do

  factory :member_role, class: :role do
    name 'Member'
  end

  factory :newuser , class: User do
    email "taylor@ait.ac.th"
    password "password"
    password_confirmation "password"
    role {FactoryGirl.create(:member_role)}
  end

  factory :olduser , class: User do
    email "taylor@ait.ac.th"
    password "password"
    role {FactoryGirl.create(:member_role)}
  end

end