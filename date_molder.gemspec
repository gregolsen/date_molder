require File.join(File.dirname(__FILE__), 'lib/version.rb')

Gem::Specification.new do |s|
  s.name = %q{date_molder}
  s.version = DateMolder::VERSION 
  s.homepage = "https://github.com/gregolsen/date_molder"
  s.summary = %q{strftime format generator}
  s.description = %q{Generates an strftime format using human readable date.}
  s.email = %q{anotheroneman@yahoo.com}
  s.authors = "Innokenty Mikhailov"

  s.require_paths = ["lib"]
  s.files = Dir["lib/**/*", "Gemfile", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"] unless $SAFE > 0

  s.add_development_dependency("rspec", ["> 2.8.0"])
end
