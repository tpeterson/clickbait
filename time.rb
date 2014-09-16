require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "headlines/time.txt"
headlines = []

url = 'http://www.time.com/'

page = Nokogiri::HTML(open(url))

page.css('h2.home-icons-brief a', 'h2.home-icons-article a').each do |link|
  headlines << link.inner_html
end

File.open(URL_FILE, 'a') do |f|
  f.puts Time.now
  f.puts headlines
end

puts "Copied #{headlines.length} headlines"
