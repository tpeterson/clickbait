require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "headlines/qz_topstories.txt"
headlines = []

url = 'http://www.qz.com/'

page = Nokogiri::HTML(open(url))

page.css('#top-stories h2').each do |link|
  headlines << link.inner_html
end

File.open(URL_FILE, 'a') do |f|
  f.puts Time.now
  f.puts headlines
end

puts "Copied #{headlines.length} headlines"
