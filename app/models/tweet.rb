class Tweet < ActiveRecord::Base

  def self.send_tweet(string)
        
    # You will need to set your application type to
    # read/write on dev.twitter.com and regenerate your access
    # token.  Enter the new values here:
    consumer_key = OAuth::Consumer.new(
      "nfgH3eSl0lEvfNt1RC4wkJCwj",
      "h6dccbzlQrV8JQXSKRrcqvPUsQdDL3fXPw3bxwCb4aCmto5KEn")
    access_token = OAuth::Token.new(
      "1700609923-cu1Rb6CcFJhpL0Be68ZdKOyLz9eoGJNlwhJCaCw",
      "HpZ6ooBe55A5qsnMdocxX4o0cmcEpE8vynBUIIVcQcxWJ")

    # Note that the type of request has changed to POST.
    # The request parameters have also moved to the body
    # of the request instead of being put in the URL.
    baseurl = "https://api.twitter.com"
    path    = "/1.1/statuses/update.json"
    address = URI("#{baseurl}#{path}")
    request = Net::HTTP::Post.new address.request_uri
    request.set_form_data(
      "status" => "#{string}",
    )

    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # Issue the request.
    request.oauth! http, consumer_key, access_token
    http.start
    response = http.request request

    # Parse and print the Tweet if the response code was 200
    tweet = nil
    if response.code == '200' then
      tweet = JSON.parse(response.body)
      puts "Successfully sent #{tweet["text"]}"
    else
      puts "Could not send the Tweet! " +
      "Code:#{response.code} Body:#{response.body}"
    end
    puts "marc is sending a tweet"
  end

  def self.fetch_timeline(screen_name)
    # Now you will fetch /1.1/statuses/user_timeline.json,
    # returns a list of public Tweets from the specified
    # account.
    baseurl = "https://api.twitter.com"
    path    = "/1.1/statuses/user_timeline.json"
    query   = URI.encode_www_form(
        "screen_name" => "#{screen_name}",
        "count" => 10,
    )
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri

    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # If you entered your credentials in the first
    # exercise, no need to enter them again here. The
    # ||= operator will only assign these values if
    # they are not already set.
    consumer_key ||= OAuth::Consumer.new "nfgH3eSl0lEvfNt1RC4wkJCwj",
      "h6dccbzlQrV8JQXSKRrcqvPUsQdDL3fXPw3bxwCb4aCmto5KEn"
    access_token ||= OAuth::Token.new "1700609923-cu1Rb6CcFJhpL0Be68ZdKOyLz9eoGJNlwhJCaCw",
      "HpZ6ooBe55A5qsnMdocxX4o0cmcEpE8vynBUIIVcQcxWJ"
    # Issue the request.
    request.oauth! http, consumer_key, access_token
    http.start
    response = http.request request

    # Parse and print the Tweet if the response code was 200
    tweets = nil
    if response.code == '200' then
      tweets_all = []
      tweets = JSON.parse(response.body)
      # print_timeline(tweets)
      tweets.each do |tweet|
      # tweets_all << tweet["text"].split(' ').reject {|word| word.length > 10}

      array = ["@", "http", "#"]
      # tweets_all << tweet["text"].split(' ').delete_if{|x| array.include?(x.chars)}
      tweets_all << tweet["text"].split(' ').reject {|word| word.length > 13}
      
      # tweets = tweets_all.split(" ").delete

      # tweets[0]["text"]
    end
    
    tweets_all
    # nil
    # puts response.code
  end
  end
end