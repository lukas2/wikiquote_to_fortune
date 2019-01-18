require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Get name and make url

if ARGV[0].nil?
	puts "I need at least one parameter."
	exit 1
end

page = ARGV[0]
url = "https://en.wikiquote.org/w/index.php?action=edit&title=#{ARGV[0].gsub("\s","_")}"

# parse and extract quotes

document = Nokogiri::HTML.parse(open(url))

text = document.xpath("//textarea[@name='wpTextbox1']").text
extract = text.scan(/^\*.*$/)

# remove sources (start with **)

extract.reject! do |line|
	line =~ /^\*\*/
end

# remove mediawiki tags

extract.collect! do |line|
  line
  	.gsub("''","")
  	.gsub(/{{.*?}}/,"")
  	.gsub(/<\/?[^>]+>/, "")
  	.gsub(/^\*/,"")
  	.gsub(/^\s/,"")
  	.gsub(/\[\[w:/,"")
  	.gsub(/\|.*?\]\]/, "")
  	.gsub("[[","")
  	.gsub("]]","")
end

# Leave out empty lines and list items that only contain urls

extract.reject!{ |line| line =~ /^\[http.*/ }
extract.reject!{ |line| line.length < 3}

# Join and print

joined = extract.join "\n%\n"

puts joined

