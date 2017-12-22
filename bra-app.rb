require 'rubygems'
require 'daemons'

pwd = Dir.pwd
`touch #{pwd}/bra-app.log`

@options = {
	:dir_mode   => :normal,
	:dir        => '/tmp/',
	:multiple   => false,
	:backtrace  => true,
	:monitor    => false,
	:log_dir    => "#{pwd}/log",
	:log_output => true,
	:output_logfilename => "bra-app.log",
	:logfilename => "bra-app.log"
}
Daemons.run_proc('bra-app', @options) do
	Dir.chdir(pwd)
	exec "ruby ui.rb"
end
