spec = Gem::Specification.new do |s|
  s.name              = "spell_checker"
  s.version           = "0.0.1"
  s.author            = "Stewart McKee"
  s.email             = "stewart.mckee@vamosa.com"
  s.homepage          = "http://www.vamosa.com"
  s.platform          = Gem::Platform::RUBY
  s.summary           = "Word spell checker"
  s.files             = Dir["{spec,lib}/**/*"].delete_if { |f| f =~ /(rdoc)$/i }
  s.require_path      = "lib"
  s.has_rdoc          = false
  s.extra_rdoc_files  = ["README"]
  s.add_dependency("stemmer")
end
