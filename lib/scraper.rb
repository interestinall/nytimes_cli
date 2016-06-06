require 'open-uri'


require 'pry'

require 'mechanize'

class Scraper

  BASE_URL = "http://www.nytimes.com"

  def self.scrape_front_page

    agent = Mechanize.new
    index = agent.get(BASE_URL)
    front_page_articles = []
    

    index.css(".story-heading").each do |story|
      val =  story.css("a").text 
      next if val.nil? || val == false || val == ""
      hash = {
       
         :title => story.css("a").text,  
         :url => story.css('a').attribute('href').value
      }

      front_page_articles  << hash
    end
    front_page_articles 
   end

  def self.article(url)

    agent = Mechanize.new
    article = agent.get(url)
    stories = []
    story_hash = {}

    title = article.search("//*[@id='headline']").text
    author = article.search('.byline-author').text
  
    story_hash[:title] = title
    story_hash[:author] = author

    article_string = ""
   
    article.search(".story-body *").each do |paragraph|
      
      #check p and h4, save each accordingly <<- append newline to end of each
      if paragraph.name == "p" && paragraph.children.text != "Advertisement"
         article_string << paragraph.children.text + "\n" + "\n" 
      elsif paragraph.name == "h4" && !paragraph.children.text.nil?
         #add subheader
         article_string << paragraph.children.text + "\n" + "\n" 
      end
      
    end
    story_hash[:story] = article_string
    

    binding.pry

    story_hash
    
    
  end





end

