require 'rubygems'
require 'daemons'

pwd = Dir.pwd
Daemons.run_proc('bra-app', {:dir_mode => :normal, :dir => "/tmp/"}) do
	Dir.chdir(pwd)
	exec "ruby ui.rb"
end
