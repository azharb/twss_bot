require 'net/http'

class RedditController < ApplicationController
  def GoRead
      @nextBatch = ""
      @comments = []
      for i in 0..2
          sleep(1)
          res1 = getResponse(@nextBatch)
          @comments.concat(ActiveSupport::JSON.decode(res1.body)["data"]["children"])
          newBatch = ActiveSupport::JSON.decode(res1.body)["data"]["after"]
          break if newBatch == @nextBatch
          @nextBatch = newBatch
      end
  end
    
  def getResponse(id="")
      
      url = URI.parse('http://www.reddit.com/r/all/comments.json?limit=100&id='+id)
      req = Net::HTTP.get_response(url)
      
      return req
  end
end
