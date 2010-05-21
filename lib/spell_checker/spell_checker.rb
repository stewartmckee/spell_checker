require 'stemmer'

class SpellChecker
  def initialize(params={})
    
    if params[:type].nil? 
      @dictionary = TextDictionary.new(params)
    else
      if params[:type] == :mysql
        @dictionary = MysqlDictionary.new(params)
      elsif params[:type] == :text
        @dictionary = TextDictionary.new(params)
      else
        raise "invalid dictionary type #{params[:type]}"
      end
    end
    
  end
  
  def check_word(word)
    @dictionary.word_exists?(word.stem)
  end
  
  def stem_dictionary
    @dictionary.filter_stemmed_words
  end
end
