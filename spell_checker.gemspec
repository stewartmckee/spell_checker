spec = Gem::Specification.new do |s|
  s.name              = "spell_checker"
  s.version           = "0.0.3"
  s.author            = "Stewart McKee"
  s.email             = "stewart@theizone.co.uk"
  s.homepage          = "http://rockwellcottage.com"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "Word spell checker"
  s.files             = Dir["{spec,lib}/**/*"].delete_if { |f| f =~ /(rdoc)$/i }
  s.require_path      = "lib"
  s.has_rdoc          = false
  s.extra_rdoc_files  = ["README.textile"]
  s.add_dependency("stemmer")
end
