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
    string = hash[:story]
    a.story = self.word_wrap(hash[:story])
    a
  end

  def self.word_wrap(text)
   
    paragraphs = []

    paragraphs = text.split(/\n/)
    finshed_text = ""
    

    paragraphs.each do |p|
      final_p = self.p_wrap(p, 78)
      finshed_text << "\n" + final_p
    end
    finshed_text
  end
  

  def self.p_wrap(s, width=78)
    lines = []
    line = ""
    s.split(/\s+/).each do |word|
      if line.size + word.size >= width
        lines << line
        line = word
      elsif line.empty?
       line = word
      else
       line << " " << word
     end
     end
     lines << line if line
    return lines.join "\n"
  end

 







end