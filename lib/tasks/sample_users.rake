require 'faker'

namespace :db do 
  desc "Fill database with sample users."
  task :sample => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => 'Charlie Root',
      :email => 'charlietheroot@localhost.com',
      :password => 'admin',
      :password_confirmation => 'admin')
    100.times do |n|
      name = Faker::Name.name
      email = "sample-#{n+1}@foobar.com"
      User.create!(:name => name,
        :email => email,
        :password => 'foobar',
        :password_confirmation => 'foobar')
    end
  end
end
