FactoryGirl.define do
  factory :user do
    email "Mike@yahoo.com"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :product do
    name "Firecracker"
    description "A 4th of July favorite"
    price "$135"
  end
end
