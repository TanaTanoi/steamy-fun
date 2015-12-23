class Story
  attr_reader :title, :url, :external, :author, :summary, :date

  def initialize(news_item)
    @title, @url, @external, @author, @summary, @date = Story.parse_hash(news_item)
  end

  def self.parse_hash(news_item)
    [
      news_item["title"],
      news_item["url"],
      parse_bool(news_item["is_external_url"]),
      news_item["author"],
      news_item["contents"],
      parse_date(news_item["date"])
    ]
  end

  def open_url
    system "open #{@url}"
  end

  def self.parse_bool(string)
    string == "true"
  end

  def self.parse_date(sec)
    Time.at(sec)
  end

  def to_s
    "
    #{@title}                 \n
    Author: #{@author}        \n
    Date:   #{@date.asctime}  \n
    #{@summary}               \n
    "
  end
end
