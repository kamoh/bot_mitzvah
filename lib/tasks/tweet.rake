desc "Tweet"
task :tweet => :environment do 
  # find a mention of 'my bat mitzvah'
  # reply to the tweeter with a custom reply'

  # $client.search("'my bat mitzvah'", result_type: "recent").take(1).collect do |tweet|
  #   # $client.update("@testynotreal Mazel tov!")
  #   byebug
  #   # $client.update("@#{tweet.user.screen_name} Mazel tov!", {in_reply_to_status_id: tweet.id})
  #   # $client.update("@#{tweet.user.screen_name} Mazel tov!", {in_reply_to_status_id: tweet.id})
  #   # retweeted_status
  # end

  # $client.search("'my bat mitzvah'", result_type: "recent").take(3).collect { |tw| puts "tweet id #{tw.id} was returned" if tw.retweeted_status.nil? }

  bat_mitz_tweet = $client.search("'my bat mitzvah'", result_type: "recent").take(5).detect { |tw| tw.retweeted_status.nil? }

  if bat_mitz_tweet
    $client.update("@#{bat_mitz_tweet.user.screen_name} Mazel tov!", {in_reply_to_status_id: bat_mitz_tweet.id}) if bat_mitz_tweet
  end


end

desc 'Rake test'
task :test => :environment do 
  puts 'test task'
end