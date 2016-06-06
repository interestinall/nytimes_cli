# cli controller

class NytimesCli::CLI

  def call
    puts ""
    puts ""
    puts "Welcome to Nytimes CLI"
    puts "All articles © The New York Times"
    puts "http://www.nytimes.com"
    puts ""
    puts ""
    puts ""
    puts "Enter a number followed by the enter key."
    puts "1. Front page "
    puts "2. Sections "
    puts ""
    puts ""

    # get_front_page
    get_story

  end


  def get_front_page
    s = Scraper.scrape_front_page
  
    s
  end

  def get_story
    s = Scraper.article("http://www.nytimes.com/2016/06/07/nyregion/public-school-188-in-manhattan-about-half-the-students-are-homeless.html")
    s
  end


  #TODO


  def list_categories
  end

  #TODO
  def list_articles
  end
  #TODO
  def show_article
  end

end