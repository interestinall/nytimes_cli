# cli controller

class NytimesCli::CLI

  attr_accessor :index

  def call
    puts ""
    puts ""
    puts "Welcome to Nytimes CLI"
    puts "All articles © The New York Times"
    puts "http://www.nytimes.com"
    puts ""
    puts ""
    front
    puts ""
    puts ""
    puts "There are currently " + num_articles + " articles on the front page of nytimes.com."
    puts ""
    num = get_articles.length
    index(num)
    interface_logic

  end




  def get_articles_from_front_page
    array = Scraper.scrape_front_page
    articles = Article.create_articles_from_array(array)
    articles
  end

  def num_articles
    get_articles.length.to_s
  end

  def input_to_index(num)
    num.to_i - 1
  end

  def front
    print_articles(0, 9)
  end


  #TODO
  def print_articles(first_index, last_index )
    array = get_articles_from_front_page
    a = array[first_index..last_index]
    a.each do |article|
      all_articles = get_articles
      i = all_articles.index(article) + 1
      puts  i.to_s + ". " + article.title
    end
    puts ""
    puts ""
   
  end

  def index(num)
    @index = Navagation.new(num)
  end

  def get_articles
    Article.all
  end

  def get_article_url(num)
    i = input_to_index(num)
    a = get_articles[i]
    a.url
  end

  def get_article(url)
    hash = Scraper.scrape_article(url)
    article = Article.create_article_from_hash(hash)
  end


  def print_article(num)
    url = get_article_url(num)
    a = get_article(url)
    puts ""
    puts ""
    puts a.title
    puts ""
    puts a.author
    puts ""
    puts a.story
    puts ""
    puts ""
    puts "Link to nytimes.com: " + a.url
    puts ""
    puts ""

  end

  def show_manual

    puts "man   ->  displays manual"
    puts "front ->  shows first ten headlines"
    puts "more  ->  shows 10 more headlines"
    puts "less  ->  shows previous 10 headlines"
    puts "exit  ->  terminates program"
    puts ""
    puts ""
    puts "All articles © The New York Times"
    puts "http://www.nytimes.com"
    puts ""
    puts ""

  end

  def more
    @index.more
    print_articles(@index.start_index, @index.end_index)
  end

  def less
    @index.less
    print_articles(@index.start_index, @index.end_index)
  end

  def interface_logic
     while true
      puts "Enter the number you would like to read or 'man' to see a list of commands."
      answer = gets.chomp
      if answer.upcase == "EXIT"
        puts ""
        puts "Ciao. Auf Wiedersehen. Goodbye."
        puts ""
        puts ""
        exit
      elsif answer.to_i.class == Fixnum && answer.to_i != 0
        print_article(answer)
      elsif answer.upcase == "MAN"
        show_manual
      elsif answer.upcase == "MORE"
        more
      elsif answer.upcase == "LESS"
        less
      elsif answer.upcase == "FRONT"
        print_articles(0, 9)
      else
        puts ""
        puts ""
        puts "That was not a valid entry. Please try again."
        puts ""
        puts ""
      end
         
    end

  end

 




end