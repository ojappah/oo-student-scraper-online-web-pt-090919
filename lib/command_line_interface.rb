require_relative "../lib/scraper.rb"
require_relative "../lib/student.rb"
require 'nokogiri'
require 'colorize'

class CommandLineInterface
  BASE_PATH = "http://www.fakenamegenerator.com/gen-male-us-us.php"


  def run
    make_friends
    display_friends
  end

  def make_friends
    @friends_array = Scraper.scrape_index_page(BASE_PATH)
    Friend.create_from_collection(@friends_array)
  end

  def display_friends
    Friend.all.each do |friend|
      puts "#{friend.name.upcase}".colorize(:blue)
      puts "  address:".colorize(:light_blue) + " #{friend.address}"
      puts "  phone:".colorize(:light_blue) + " #{friend.phone}"
      puts "  birthday:".colorize(:light_blue) + " #{friend.birthday}"
      puts "  age:".colorize(:light_blue) + " #{friend.age}"
      puts "----------------------".colorize(:green)
    end
  end

end
