require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellChecker do

  it "should create a SpellChecker object" do
    
    SpellChecker.new.should be_an_instance_of SpellChecker
  
  end
  
  it "should return true for valid word" do
    spell = SpellChecker.new
    spell.check_word("word").should be_true
  end
  
  it "should return false for an invalid word" do
    spell = SpellChecker.new
    spell.check_word("wordd").should be_false
  end
  
  describe "using stemming" do
    
    it "should return true for plural" do 
      spell = SpellChecker.new
      spell.check_word("words").should be_true
      spell.check_word("fishes").should be_true
      spell.check_word("fishing").should be_true
      spell.check_word("fished").should be_true
      spell.check_word("fisher").should be_true
    end
  end
  
end
