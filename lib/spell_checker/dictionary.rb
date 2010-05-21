
class Dictionary
  
end


class MysqlDictionary < Dictionary
  
end

class TextDictionary < Dictionary
  require 'ftools'

  def initialize(params={})
    @params = params
    if @params[:base_dictionary].nil?
      @base_file = File.expand_path(File.dirname(__FILE__) + "/dictionary.txt")
    else
      @base_file = @params[:base_dictionary]
      raise "Unable to find base dictionary '#{@params[:base_dictionary]}'" unless File.exist?(@params[:base_dictionary])
    end
    if @params[:custom_dictionary].nil?
      @custom_file = File.expand_path(File.dirname(__FILE__) + "/custom.txt")
    else
      @custom_file = @params[:custom_dictionary]
      raise "Unable to find base dictionary '#{@params[:custom_dictionary]}'" unless File.exist?(@params[:custom_dictionary])
    end
  end
  
  def word_exists?( word )
    unles
    File.open(@custom_file, "w") unless File.exists?(@custom_file)
    File.open(@base_file, "w") unless File.exists?(@base_file)
    
    File.open( @custom_file ) do |io|
      io.each {|line| line.chomp! ; return true if line == word}
    end
    File.open( @base_file ) do |io|
      io.each {|line| line.chomp! ; return true if line == word}
    end
    false
  end

   def filter_stemmed_words
    dictionary = []
    puts "loading stemmed list"
    File.move (@base_file, File.expand_path(File.dirname(@base_file) + "/original_dictionary.txt"))
    File.open( File.expand_path(File.dirname(__FILE__) + "/original_dictionary.txt") ) do |io|
      io.each {|line| puts "loading #{line}"; line.chomp! ; dictionary << line.stem}
    end

    dictionary.uniq!
    puts "#{dictionary.length} stemmed words found"
    
    puts "writing to #{@base_file}"
    File.open(@base_file, "w") do |io|
      dictionary.each do |word|
        io.write(word + "\n")
      end
    end
    
  end

end
