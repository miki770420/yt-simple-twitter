namespace :dev do
  task fake_user: :environment do

    20.times do |i|
      User.create!(
      name: FFaker::Name.first_name,
      email: FFaker::Internet.disposable_email,
      password: FFaker::Internet.password,
      introduction: FFaker::Lorem.paragraph
      )
    end
    puts "have created fake user"
    puts "now you have #{User.count} user data"
  end

  task fake_tweet: :environment do
    Tweet.destroy_all

    50.times do |i|
      Tweet.create!(
      user: User.all.sample,
      description: FFaker::Lorem.paragraph
      )
    end
    puts "have created fake tweet"
    puts "now you have #{Tweet.count} tweets data"
  end

end