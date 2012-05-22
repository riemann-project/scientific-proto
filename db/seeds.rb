# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = FactoryGirl.build(:user)
u.confirm!
u.reset_authentication_token!
u.save

u = FactoryGirl.build(:user_bob)
u.confirm!
u.save

# Generate Badges
FactoryGirl.create(:gold_badge)
FactoryGirl.create(:silver_badge)