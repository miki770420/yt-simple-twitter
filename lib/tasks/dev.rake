namespace :dev do

  task fake_followship: :environment do
  Followship.destroy_all

  User.all.each do |user|
    10.times do |i|
      user.followships.create!(
      following: User.select(:id).distinct
      )
    end
  end
    puts "have created fake followship"
    puts "now you have #{Followship.count} followship data"
  end

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

  task fake_reply: :environment do
    Reply.destroy_all

    Tweet.all.each do |tweet|
      5.times do |i|
        tweet.replies.create!(
        user: User.all.sample,
        comment: FFaker::BaconIpsum.sentence
        )
      end
    end
    puts "have created fake reply"
    puts "now you have #{Reply.count} replies data"
  end

end