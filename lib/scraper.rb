require "open-uri"
require "nokogiri"
require "pry"
class Scraper

  def self.scrape_index_page(index_page)
    index_page = Nokogiri::HTML(open(index_page))
    friend = index_page.css("div.info .content")
        friend_name = friend.css('div.address.h3').text
        friend_address = friend.css('div.adr').text
        friend_phone = friend.css('div.extra > dl:nth-child(5) > dd').text
        friend_birthday = friend.css('div.extra > dl:nth-child(8) > dd').text
        friend_age = friend.css('div.extra > dl:nth-child(9) > dd').text

        friends << {name: friend_name, address: friend_address, phone: friend_phone, birthday: friend_birthday, age: friend_age}
    friends
  end

end
