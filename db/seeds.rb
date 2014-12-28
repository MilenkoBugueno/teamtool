# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email


idea_move = MoveType.create( :title => "Idea", :icon_path => "idea.png")
tomato = MoveType.create( :title => "Tomato", :icon_path => "tomaterot.png")
vision = MoveType.create( :title => "Vision", :icon_path => "blitz.png")
user_story = MoveType.create( :title => "User Story", :icon_path => "user_story.png", :user_story => true)
todo_today = MoveType.create( :title => "Todo Today", :icon_path => "todo_today.gif", :day_plan => true)
sprint = MoveType.create( :title => "Sprint", :icon_path => "sprint.gif", :sprint => true)
