require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

buzzfeed_url = 'http://www.buzzfeed.com/'
buzzfeed_URL_FILE = "headlines_loop/buzzfeed.txt"
buzzfeed_headlines = []

distractify_url = 'http://news.distractify.com/'
distractify_URL_FILE = "headlines_loop/distractify.txt"
distractify_headlines = []

elitedaily_url = 'http://elitedaily.com/'
elitedaily_URL_FILE = "headlines_loop/elitedaily.txt"
elitedaily_headlines = []

upworthy_url = 'http://www.upworthy.com/'
upworthy_URL_FILE = "headlines_loop/upworthy.txt"
upworthy_headlines = []

viralnova_url = 'http://www.viralnova.com/'
viralnova_URL_FILE = "headlines_loop/viralnova.txt"
viralnova_headlines = []

nyt_url = 'http://www.nytimes.com/'
nyt_URL_FILE = "headlines_loop/nytimes.txt"
nyt_headlines = []

qz_url = 'http://www.qz.com/'
qz_URL_FILE = "headlines_loop/qz.txt"
qz_headlines = []

time_url = 'http://www.time.com/'
time_URL_FILE = "headlines_loop/time.txt"
time_headlines = []

vox_url = 'http://www.vox.com/'
vox_URL_FILE = "headlines_loop/vox.txt"
vox_headlines = []

#stop_time = Time.new(2014, 9, 18)

#until Time.now >= stop_time do

#BUZZFEED
  buzzfeed_page = Nokogiri::HTML(open(buzzfeed_url))
  buzzfeed_page.css('.homepage-columns h2 a').each do |link|
    buzzfeed_headlines << link.inner_html
  end
  File.open(buzzfeed_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts buzzfeed_headlines[0..9]
  end

#DISTRACTIFY
  distractify_page = Nokogiri::HTML(open(distractify_url))
  distractify_page.css('#top-post-wrapper h2 a', '.post-item-wrapper h3 a').each do |link|
    distractify_headlines << link.inner_html
  end
  File.open(distractify_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts distractify_headlines[0..9]
  end

#ELITEDAILY
  elitedaily_page = Nokogiri::HTML(open(elitedaily_url))
  elitedaily_page.css('header.postHeader h2 a').each do |link|
    elitedaily_headlines << link.inner_html
  end
  File.open(elitedaily_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts elitedaily_headlines[0..9]
  end

#UPWORTHY
  upworthy_page = Nokogiri::HTML(open(upworthy_url))
  upworthy_page.css('#featured-nuggets a', '.nugget a[data-ga-action="Nugget Grid"]').each do |link|
    upworthy_headlines << link.inner_html
  end
  File.open(upworthy_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts upworthy_headlines[0..9]
  end

#VIRALNOVA
  viralnova_page = Nokogiri::HTML(open(viralnova_url))
  viralnova_page.css('.snip a').each do |link|
    viralnova_headlines << link.inner_html
  end
  File.open(viralnova_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts viralnova_headlines[0..9]
  end

#NYTIMES
  nyt_page = Nokogiri::HTML(open(nyt_url))
  nyt_page.css('h2.story-heading a').each do |link|
    nyt_headlines << link.inner_html
  end
  File.open(nyt_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts nyt_headlines[0..9]
  end

#QUARTZ
  qz_page = Nokogiri::HTML(open(qz_url))
  qz_page.css('#top-stories h2').each do |link|
    qz_headlines << link.inner_html
  end
  File.open(qz_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts qz_headlines[0..9]
  end

#TIME
  time_page = Nokogiri::HTML(open(time_url))
  time_page.css('h2.home-icons-brief a', 'h2.home-icons-article a').each do |link|
    time_headlines << link.inner_html
  end
  File.open(time_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts time_headlines[0..9]
  end

#VOX
  vox_page = Nokogiri::HTML(open(vox_url))
  vox_page.css('.m-hp-latest__list-container a').each do |link|
    vox_headlines << link.inner_html
  end
  File.open(vox_URL_FILE, 'a') do |f|
    f.puts Time.now
    f.puts vox_headlines[0..9]
  end

#puts "Scraped at #{Time.now}"
#sleep 86400
#end
puts "Copied #{buzzfeed_headlines.length} BuzzFeed headlines"
puts "Copied #{distractify_headlines.length} Distractify headlines"
puts "Copied #{elitedaily_headlines.length} EliteDaily headlines"
puts "Copied #{nyt_headlines.length} New York Times headlines"
puts "Copied #{qz_headlines.length} Quartz headlines"
puts "Copied #{time_headlines.length} Time headlines"
puts "Copied #{upworthy_headlines.length} Upworthy headlines"
puts "Copied #{viralnova_headlines.length} ViralNova headlines"
puts "Copied #{vox_headlines.length} Vox headlines"
puts "FINISHED"
