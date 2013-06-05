# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name "Joe"
    last_name "Schmoe"
    sequence(:email) {|n| "test#{n}@example.com"}
  end
end
