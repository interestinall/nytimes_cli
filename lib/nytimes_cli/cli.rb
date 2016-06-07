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
    print_articles(0, 9 )
    puts ""
    puts ""
    puts "There are currently " + num_articles + " articles."
    puts "Enter the number you would like to read"
    num = gets.chomp
    print_article(num)
   

  end


  #get array of hashes, front page articles, print them
  # user chooses number
  # user number to get the number of the hash, pull out the url, 
  # send url to get the indivudal story
  # print story


  def get_articles_from_front_page
    array = Scraper.scrape_front_page
    articles = Article.create_articles_from_array(array)
  end

  def num_articles
    articles.length.to_s
  end

  def input_to_index(num)
    num.to_i - 1
  end


  #TODO
  def print_articles(first_index, last_index )
    array = get_articles_from_front_page
    a = array[first_index..last_index]
    a.each_with_index do |article, index|
      i = index + 1
      puts i.to_s + ". " + article.title
    end
   
  end

  def articles
    Article.all
  end


  #TODO
  def get_article_url(num)
   i = input_to_index(num)
   a = articles[i]
   a.url
  end

  def get_article(url)
    hash = Scraper.scrape_article(url)
    article = Article.create_article_from_hash(hash)
  end

  # def show_article(url)
  #   a = get_article
  #   puts a.title
  #   puts ""
  #   puts a.author
  #   puts ""
  #   puts a.story
  #   puts ""
  #   puts ""
  #   puts "Link to nytimes.com: " + a.url 
  # end

  def print_article(num)
    url = get_article_url(num)
    a = get_article(url)
    puts a.title
    puts ""
    puts a.author
    puts ""
    puts a.story
    puts ""
    puts ""
    puts "Link to nytimes.com: " + a.url

  end

 




end