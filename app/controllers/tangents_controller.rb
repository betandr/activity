require 'twitter'

class TangentsController < ApplicationController

  def index
      location = params[:geocode]

      client = Twitter::REST::Client.new do |config|
          config.consumer_key        = Rails.application.secrets.twitter_consumer_key
          config.consumer_secret     = Rails.application.secrets.twitter_consumer_secret
          config.access_token        = Rails.application.secrets.twitter_access_token
          config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
      end

      tweet_text_mash = ""
      client.search("news", {:geocode => location}).each do |tweet|
          tweet_text_mash << tweet.text
      end

      hash = make_hash_of_words tweet_text_mash

      results = []
      hash.sort{|a,b| b[1]<=>a[1]}.each { |elem|
        puts "\"#{elem[0]}\" has #{elem[1]} occurrences"
        results << elem[0]
      }

      trends = {"location" => location, "results" => results}

      render :json => trends
  end

  def make_hash_of_words(text)
      hash = Hash.new
      text.split(" ").each do |word|
          unless should_ignore word
              word = word.downcase.gsub('?', '').gsub('!', '')
              if hash.has_key? word then
                  hash[word] = hash[word] + 1
              else
                  hash[word] = 1
              end
          end
      end

      hash
  end

  def should_ignore(word)

      if word.include? "http"
          return true
      elsif word.length < 4
          return true
      elsif !word.match /^[a-z]+$/
          return true
      elsif word.match /^news$/
          return true
      elsif word.match /^one$/
          return true
      elsif word.match /^two$/
          return true
      elsif word.match /^three$/
          return true
      elsif word.match /^four$/
          return true
      elsif word.match /^five$/
          return true
      elsif word.match /^six$/
          return true
      elsif word.match /^seven$/
          return true
      elsif word.match /^eight$/
          return true
      elsif word.match /^nine$/
          return true
      elsif word.match /^ten$/
          return true
      elsif word.match /^the$/
          return true
      elsif word.match /^the+$/
        return true
      elsif word.match /^be+$/
        return true
      elsif word.match /^to+$/
        return true
      elsif word.match /^of+$/
        return true
      elsif word.match /^and+$/
        return true
      elsif word.match /^a+$/
        return true
      elsif word.match /^in+$/
        return true
      elsif word.match /^that+$/
        return true
      elsif word.match /^have+$/
        return true
      elsif word.match /^I+$/
        return true
      elsif word.match /^it+$/
        return true
      elsif word.match /^for+$/
        return true
      elsif word.match /^not+$/
        return true
      elsif word.match /^on+$/
        return true
      elsif word.match /^with+$/
        return true
      elsif word.match /^he+$/
        return true
      elsif word.match /^as+$/
        return true
      elsif word.match /^you+$/
        return true
      elsif word.match /^do+$/
        return true
      elsif word.match /^at+$/
        return true
      elsif word.match /^this+$/
        return true
      elsif word.match /^but+$/
        return true
      elsif word.match /^his+$/
        return true
      elsif word.match /^by+$/
        return true
      elsif word.match /^from+$/
        return true
        elsif word.match /^sure+$/
          return true
      elsif word.match /^been+$/
        return true
      elsif word.match /^they+$/
        return true
      elsif word.match /^we+$/
        return true
      elsif word.match /^say+$/
        return true
      elsif word.match /^her+$/
        return true
      elsif word.match /^she+$/
        return true
      elsif word.match /^or+$/
        return true
      elsif word.match /^an+$/
        return true
      elsif word.match /^will+$/
        return true
      elsif word.match /^my+$/
        return true
      elsif word.match /^one+$/
        return true
      elsif word.match /^all+$/
        return true
      elsif word.match /^would+$/
        return true
      elsif word.match /^there+$/
        return true
      elsif word.match /^their+$/
        return true
      elsif word.match /^what+$/
        return true
      elsif word.match /^so+$/
        return true
      elsif word.match /^up+$/
        return true
      elsif word.match /^out+$/
        return true
      elsif word.match /^if+$/
        return true
      elsif word.match /^about+$/
        return true
      elsif word.match /^who+$/
        return true
      elsif word.match /^get+$/
        return true
      elsif word.match /^which+$/
        return true
      elsif word.match /^go+$/
        return true
      elsif word.match /^me+$/
        return true
      elsif word.match /^when+$/
        return true
      elsif word.match /^make+$/
        return true
      elsif word.match /^can+$/
        return true
      elsif word.match /^like+$/
        return true
      elsif word.match /^time+$/
        return true
      elsif word.match /^no+$/
        return true
      elsif word.match /^just+$/
        return true
      elsif word.match /^him+$/
        return true
      elsif word.match /^know+$/
        return true
      elsif word.match /^take+$/
        return true
      elsif word.match /^people+$/
        return true
      elsif word.match /^into+$/
        return true
      elsif word.match /^year+$/
        return true
      elsif word.match /^your+$/
        return true
      elsif word.match /^good+$/
        return true
      elsif word.match /^some+$/
        return true
      elsif word.match /^could+$/
        return true
      elsif word.match /^them+$/
        return true
      elsif word.match /^see+$/
        return true
      elsif word.match /^other+$/
        return true
      elsif word.match /^than+$/
        return true
      elsif word.match /^then+$/
        return true
      elsif word.match /^now+$/
        return true
      elsif word.match /^look+$/
        return true
      elsif word.match /^only+$/
        return true
      elsif word.match /^come+$/
        return true
      elsif word.match /^its+$/
        return true
      elsif word.match /^over+$/
        return true
      elsif word.match /^think+$/
        return true
      elsif word.match /^also+$/
        return true
      elsif word.match /^back+$/
        return true
      elsif word.match /^after+$/
        return true
      elsif word.match /^use+$/
        return true
      elsif word.match /^two+$/
        return true
      elsif word.match /^how+$/
        return true
      elsif word.match /^our+$/
        return true
      elsif word.match /^work+$/
        return true
      elsif word.match /^first+$/
        return true
      elsif word.match /^well+$/
        return true
      elsif word.match /^way+$/
        return true
      elsif word.match /^even+$/
        return true
      elsif word.match /^new+$/
        return true
      elsif word.match /^want+$/
        return true
      elsif word.match /^because+$/
        return true
      elsif word.match /^any+$/
        return true
      elsif word.match /^these+$/
        return true
      elsif word.match /^give+$/
        return true
      elsif word.match /^day+$/
        return true
      elsif word.match /^most+$/
        return true
      elsif word.match /^us+$/
        return true
      else
          return false
      end
  end
end
