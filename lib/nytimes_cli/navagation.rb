# require 'pry'

class Navagation

  attr_accessor :start_index, :end_index, :articles_length

  def initialize(length)
    @start_index = 0
    @end_index = 9
    @articles_length = length
  end
  

   def more
    if @end_index + 10 < @articles_length
      @start_index += 10
      @end_index += 10
    else
      @start_index = @articles_length - 9
      @end_index = @articles_length
    end  
  end

  def less
    if @start_index >= 10
      @start_index -= 10
      @end_index = @start_index + 9
    else
      @start_index = 0
      @end_index = 9
    end
  end

end