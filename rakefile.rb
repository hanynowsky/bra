task default: %w[test]

task :test do
	  ruby "test/test.rb"
end

require 'rake/testtask'

Rake::TestTask.new do |t|
	  t.libs << 'test'
end

desc "Run tests"
task :default => :test
