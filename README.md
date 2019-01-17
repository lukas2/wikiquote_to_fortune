# wikiquote_to_fortune
A little ruby script that extracts quotes from wikiquote and outputs them for fortune

## Requirements

nokogiri

## Usage

Let's say you want to extract the sayings of Ralph Waldo Emerson..

     ruby wikiquote_to_fortune.rb "Ralph Waldo Emerson"

You get a wall of text.. which is actually in the right format for fortune. 

If you have fortune installed (using homebrew is one possibility) you can type

     fortune -f
     
and you will get a list of files and the location of those files.

In my case its `/usr/local/Cellar/fortune/9708/share/games/fortunes`, so I used the script like this:

     ruby wikiquote_to_fortune.rb "Ralph Waldo Emerson" > /usr/local/Cellar/fortune/9708/share/games/fortunes/emerson
     
There is one final thing to do. We need to create a random access data file for fortune. Do this:

     cd /usr/local/Cellar/fortune/9708/share/games/fortunes/
     strfile emerson
     
That's it, now

     fortune -f
     
should list the emerson data file and 

      fortune emerson
      
should display a random Ralph Waldo Emerson quote.

## TODO

A lot, depending what you need. For example this thing could output to json or xml etc..

Check if theres some tags I haven't removed. (I have only played with two wikiquote pages for this.)

