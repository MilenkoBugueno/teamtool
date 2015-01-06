# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :certification do
    title "MyString"
    short_name "MyString"
     ""
    peer_approvements 1
    level_id 1
    move_type_id 1
    moves_goal 1
    duration ""
  end
end
