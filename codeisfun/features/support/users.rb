
FactoryGirl.define do

  factory :member_role, class: :role do
    name 'Member'
  end

  factory :admin_role, class: :role do
    name 'Admin'
  end

  factory :newuser , class: User do
    email "taylor@ait.ac.th"
    password "password"
    password_confirmation "password"
    role {FactoryGirl.create(:member_role)}
  end

  factory :olduser , class: User do
    # email "taylor@ait.ac.th"
    username "taylor"
    email "taylor@ait.ac.th"
    password "password"
    role {FactoryGirl.create(:member_role)}
  end

  factory :adminuser, class: User do
    username "admin"
    email "admin@ait.asia"
    password "secret123"
    role {FactoryGirl.create(:admin_role)}
  end

end
