namespace :data do

  task :rebuild => ["db:reset", :fake]
  #task :rebuild => ["db:drop","db:setup", :fake]

  task :fake => :environment do
    User.delete_all
    Post.delete_all
    Comment.delete_all

    puts "creating fake data!"

    user = User.create!( :email => "ihower@gmail.com", :password =>"12345678")

    50.times do |i|
      e = Post.create( :topic => Faker::App.name, :content => Faker::Lorem.paragraph(10))
      50.times do |j|
        e.user.create(:name => Faker::Name.name)
      end
    end
  end
end
