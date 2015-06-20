namespace :data do

  task :rebuild => ["db:reset", :fake]
  #task :rebuild => ["db:drop","db:setup", :fake]

  task :fake => :environment do
    User.delete_all
    Post.delete_all
    Comment.delete_all

    puts "creating fake data!"

    user = User.create!( :name =>'ihower',:email => "ihower@gmail.com", :password =>"12345678")

    50.times do |i|
      p = Post.create(:topic => Faker::App.name, :content => Faker::Lorem.paragraph(10))
      p.save
    end
    50.times do |j|
      u = User.create(:name => Faker::Name.name, :email => Faker::Internet.email)
    end
    50.times do |j|
      c = Comment.create(:topic => Faker::App.name, :content => Faker::Lorem.paragraph(2))
    end
  end

  task :post => :environment do
    50.times do |i|
      p = Post.create(:topic => Faker::App.name, :content => Faker::Lorem.paragraph(10))
    end
  end

end
