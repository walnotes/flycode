# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This format did not work
# User.create(name: "KingKong", email: "walterchkoning@yahoo.com", password: "123faker")
# Organization.create(name: "Test", url: "http://www.test.com", linkedin: "https://www.linkedin.com/pub/walter-koning/1/b02/a51", user_id: "1")

# This format worked. TODO: Delete this seed user after I figure out how to get the organization seed data working.
#User.create!(:name => "KingKong", :email => "walterchkoning@yahoo.com", :password => "123faker", :password_confirmation => "123faker")
# Organization.create!(:name => "Test", :url => "http://www.test.com", :linkedin => "https://www.linkedin.com/pub/walter-koning/1/b02/a51", :user => 1)

#User.delete_all	
User.destroy_all
Profile.destroy_all
tag_list = ['hero', 'villan', 'joker', 'shorter', 'runner', 'shorter', 'thinner', 'funny', 'crazy', 'driver', 'swimmer', 'dancer', 'mucisian', 'guiatarist', 'developer', 'designer', 'quality engineer', 'program manager', 'product owner', 'indian', 'american', 'mexican', 'cricketer', 'pilot']
names = ['jack', 'ivan', 'haousan', 'walter', 'makoto', 'kaitlin', 'yoko', 'feng ji', 'kishora', 'ravi raman', 'raghavan', 'siva', 'kai hu', 'kumaran', 'laura', 'george', 'boone', 'divya yadav', 'divya kaur', 'melvin', 'rajeev', 'steve lu', 'alex', 'sagar giri']
names.each { |name|
  name_with_no_space = name.downcase.split(' ').join
  new_user = User.create!(:name => name.camelize, :email => "#{name_with_no_space}@gmail.com", :password => "123faker", :password_confirmation => "123faker")
  tags = []
  (0..rand(4)).each { |i| tags << tag_list[rand(tag_list.length)] }
  new_user.profiles.create!(:name => "#{name.camelize} Profile", :url => "http://www.test.com/#{name_with_no_space}", :tag_list => tags.uniq)
}
#new_user.Organization.create!(:name => "RetlawProfile", :url => "http://www.test.com", :linkedin => "https://www.linkedin.com/pub/walter-koning/1/b02/a51")

# User.new(name: "Example User", email: "user@example.com")
# foo = User.create(name: "Foo", email: "foo@bar.com")
# User.find_by(email: "mhartl@example.com")
