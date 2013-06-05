# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@example.com"}
    sequence(:username) {|n| "test#{n}"}

    role
  end
end
