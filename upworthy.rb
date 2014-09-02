require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "headlines/upworthy.txt"
headlines = []

url = 'http://www.upworthy.com/'

page = Nokogiri::HTML(open(url))

page.css('#featured-nuggets a', '.nugget a[data-ga-action="Nugget Grid"]').each do |link|
  headlines << link.inner_html
end

File.open(URL_FILE, 'a') do |f|
  f.puts Time.now
  f.puts headlines
end

puts "Copied #{headlines.length} headlines"
