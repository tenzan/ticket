# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.exists?(email: "admin@example.com")
  User.create!(email: "admin@example.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@example.com")
  User.create!(email: "viewer@example.com", password: "password")
end

["Microsoft", "Sun Microsystems"].each do |name|
     unless Client.exists?(name: name)
       Client.create!(name: name, description: "A sample project about #{name}"
        )
end end
