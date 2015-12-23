require 'json'
require 'open-uri'

class Query
  BASE_URL = "http://api.steampowered.com/ISteamNews/GetNewsForApp/v0002"
  COUNT = 10
  MAX_LENGTH = 500

  def initialize(id)
    @id = id
  end

  def app_news_hash
    JSON.parse(open(query_url).read)
  end

  def news_items
    app_news_hash["appnews"]["newsitems"]
  end

  def query_url
    "#{BASE_URL}?appid=#{@id}&count=#{COUNT}&maxlength=#{MAX_LENGTH}"
  end
end
