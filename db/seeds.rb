# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{name: 'KingKong', email: 'walterchkoning@yahoo.com', password: '123faker'}])
Organization.create(name:'Test', url: 'http://www.test.com', linkedin: 'https://www.linkedin.com/pub/walter-koning/1/b02/a51', userid: users.first)