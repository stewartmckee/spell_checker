require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Dictionary do

  describe "using files" do
    
    before(:all) do
      @dict = TextDictionary.new
    end
  
    it "should initialize an object inheriting from Dictionary" do
      TextDictionary.new.should be_a_kind_of Dictionary
    end
    it "should create a TextDictionary object" do
      TextDictionary.new.should be_an_instance_of TextDictionary
    end
    it "should respond to the word_exists? method" do
      TextDictionary.new.should respond_to :word_exists?
    end
    it "should return true it the word exists" do
      TextDictionary.new.word_exists?("valid").should be_true
    end
    it "should return false if the word does not exist" do
      TextDictionary.new.word_exists?("sdgfdsgf").should be_false
    end
    it "should be case insensitive" do
      @dict.word_exists?("valid").should be_true
      @dict.word_exists?("Valid").should be_true
    end
    it "should suggest correct words" do
      words = @dict.suggested_words("fash")
      words.should include "fish"
    end
    it "should not use word stemming" do
      @dict.word_exists?("ship").should be_true
      @dict.word_exists?("ships").should be_false
    end
  end
    
end
