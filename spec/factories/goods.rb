# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :good do
    title "MyString"
    desc "MyText"
    category "MyString"
    pod_id 1
    pick_up false
    drop_off false
    status "MyString"
  end
end
