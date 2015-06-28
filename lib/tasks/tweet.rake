desc "Tweet"
task :tweet => :environment do 
  # Find the five most recent Bat Mitzvah tweets and take the first one that isn't a retweet
  bat_mitz_tweet = $client.search("'my bat mitzvah'", result_type: "recent").take(5).detect { |tw| tw.retweeted_status.nil? }
  # Do the thing
  if bat_mitz_tweet
    $client.update("@#{bat_mitz_tweet.user.screen_name} Mazel tov!", {in_reply_to_status_id: bat_mitz_tweet.id})
  end
end

desc 'Rake test'
task :test => :environment do 
  puts 'test task'
end

desc 'Twitter API test'
task :test_tweet => :environment do 
  puts "Tweeting to test account"
  $client.update("@testynotreal Mazel tov!")
end