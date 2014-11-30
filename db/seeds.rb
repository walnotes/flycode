# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users = User.create([{name: 'KingKong', email: 'walterchkoning@yahoo.com', password: '123faker'}])
User.new(name: "KingKong", email: "walterchkoning@yahoo.com", password: "123faker")
# Organization.create(name:"Test", url: "http://www.test.com", linkedin: "https://www.linkedin.com/pub/walter-koning/1/b02/a51", user_id: User.first.user_id)
Organization.new(name: "Test", url: "http://www.test.com", linkedin: "https://www.linkedin.com/pub/walter-koning/1/b02/a51", user_id: "1")

# User.new(name: "Example User", email: "user@example.com")
# foo = User.create(name: "Foo", email: "foo@bar.com")
# User.find_by(email: "mhartl@example.com")
