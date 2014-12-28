# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :move_type do
    title "MyString"
    icon_path "MyString"
    sprint false
    day_plan false
    user_story false
  end
end
