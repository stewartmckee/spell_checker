require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SpellChecker do

  before(:all) do
    @spell = SpellChecker.new
  end

  it "should create a SpellChecker object" do
    @spell.should be_an_instance_of SpellChecker
  end
  
  it "should return true for valid word" do
    @spell.check_word("word").should be_true
  end
  
  it "should return false for an invalid word" do
    @spell.check_word("wordd").should be_false
  end
  
  it "should return empty array for a valid paragraph" do
    result = @spell.check_paragraph("this is a valid paragraph")
    puts result
    result.should be_empty
  end
  
  it "should return true for a valid paragraph with punctuation" do
    @spell.check_paragraph("This paragraph, and the others, should be successful!").should be_empty
  end
  
  it "should return false for an invalid paragraph" do
    result = @spell.check_paragraph("This is an asldkfjs paragraph")
    result.length.should == 1
    result[0][:stemmed_word].should == "asldkfj"
    result[0][:searched_word].should == "asldkfjs"
  end
  
  it "should return true for a large paragraph" do
    paragraph = "The Jupiter Trojans are a large group of objects that share the orbit of the planet Jupiter around the Sun. Relative to Jupiter, each Trojan librates  around one of the planet's two Lagrangian points of stability, L4 and L5, that respectively lie 60° ahead of and behind the planet in its orbit. Trojan asteroids are distributed in two elongated, curved regions around these Lagrangian points with an average semi-major axis of about 5.2 AU. The first Trojan, 588 Achilles, was discovered in 1906 by the German astronomer Max Wolf. A total of 2,909 Jupiter Trojans have been found as of January 2009[update]. The name \"Trojans\" derives from the fact that, by convention, they each are named after a mythological figure from the Trojan War. The total number of Jupiter Trojans larger than 1 km is believed to be about 1 million, approximately equal to the number of asteroids larger than 1 km in the main asteroid belt. Like main belt asteroids, Trojans form families. Jupiter Trojans are dark bodies with reddish, featureless spectra. No firm evidence of the presence of water, organic matter or other chemical compounds has been obtained. The Trojans' densities (as measured by studying binaries  or rotational lightcurves) vary from 0.8 to 2.5. Trojans are thought to have been captured into their orbits during the early stages of the Solar System's formation or slightly later, during the migration of giant planets."
    result = @spell.check_paragraph(paragraph)
    puts result.inspect
    result.should be_empty
  end
  
  
  describe "using stemming" do
    
    it "should return true for plural" do 
      @spell.check_word("words").should be_true
      @spell.check_word("fishes").should be_true
      @spell.check_word("fishing").should be_true
      @spell.check_word("fished").should be_true
      @spell.check_word("fisher").should be_true
    end
  end
  
end 
