require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

URL_FILE = "headlines/vox.txt"
headlines = []

url = 'http://www.vox.com/'

page = Nokogiri::HTML(open(url))

page.css('.m-hp-block__container h2 a').each do |link|
  headlines << link.inner_html
end

File.open(URL_FILE, 'a') do |f|
  f.puts Time.now
  f.puts headlines
end

puts "Copied #{headlines.length} headlines"
