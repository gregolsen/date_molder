require 'rake'

require File.join(File.dirname(__FILE__), "lib/version.rb")

task :build do
  system "gem build date_molder.gemspec"
end

task :install => :build do
  system "gem install date_molder-#{DateMolder::VERSION}.gem"
end

task :release => :build do
  system "gem push date_molder-#{DateMolder::VERSION}.gem"
end
