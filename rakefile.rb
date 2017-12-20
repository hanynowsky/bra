task default: %w[test]

task :test do
	  ruby "tests/test.rb"
end
