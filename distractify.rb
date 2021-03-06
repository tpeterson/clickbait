require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "headlines/distractify.txt"
headlines = []

url = 'http://news.distractify.com/'

page = Nokogiri::HTML(open(url))

page.css('.l-main_top .text-holder h1', '.l-main_column .b-post_item h1').each do |link|
  headlines << link.inner_html
end

File.open(URL_FILE, 'a') do |f|
  f.puts Time.now
  f.puts headlines
end

puts "Copied #{headlines.length} headlines"
