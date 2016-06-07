class Article

  attr_accessor :title, :author, :url, :story

  @@articles = []


  def initialize(title = nil, url = nil, author = nil,  story =  nil)
    @title = title
    @author = author
    @url = url
    @story = story
  end


  def self.create_articles_from_array(array)

    array.each do |article|
      title = article[:title]
      url = article[:url]
      a =  Article.new(title, url)
      @@articles << a
    end
    @@articles
  end

  def self.all
    @@articles
  end


  def self.create_article_from_hash(hash)
    a = Article.new
    a.title = hash[:title]
    a.url = hash[:url]
    a.author = hash[:author]
    a.story = hash[:story]
    a
  end






end