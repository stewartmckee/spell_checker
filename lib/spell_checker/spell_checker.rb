require 'stemmer'

class SpellChecker
  def initialize(params={})
    @params = params
    if @params[:type].nil? 
      @dictionary = TextDictionary.new(@params)
    else
      if @params[:type] == :text
        @dictionary = TextDictionary.new(@params)
      else
        raise "invalid dictionary type #{params[:type]}"
      end
    end
    
  end
  
  def check_word(word)
    @dictionary.word_exists?(word.stem) or @dictionary.word_exists?(word)
  end
  
  def check_paragraph(paragraph)
    invalid_word_list = []
    paragraph.split(" ").map{|word| remove_punctuation(word)}.each do |word|
      if valid_word_to_check?(word)
        invalid_word_list << {:searched_word => word, :stemmed_word => word.stem, :suggested_words => @dictionary.suggested_words(word)} unless check_word(word)
      end
    end
    invalid_word_list.uniq
  end
  
  private
  
  def remove_punctuation(word)
    word.gsub(/\W+/, "")
  end
  
  def valid_word_to_check?(word)
    if @params[:ignore_uppercase].nil? or @params[:ignore_uppercase]
      return false if word.upcase == word 
    end
    if @params[:ignore_numbers].nil? or @params[:ignore_numbers]
      return false if Float(word) != nil rescue false
    end
    true
  end
  
  def stem_dictionary
    @dictionary.filter_stemmed_words
  end
end
