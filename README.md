BRA SIZE COMPUTER
=================
- "HELP: ruby bra.rb UNDERBUST BUST UNIT [COUNTRY]"
- "HELP: Example: ruby bra.rb 83 102.6 cm"
- "HELP: Example: ruby bra.rb 35.1 41.5 inch"
- "HELP: Example: ruby bra.rb 35.1 41.5 inch europe"
- "HELP: Example: ruby bra.rb 83 102 inch france"

AUTHOR
======
- Hanine HAMZIOUI BEN MADANI <hanynowsky@gmail.com>
- December 2017

REQUIREMENTS
===========
- Gem: ruby 1.9+
- Web: ```gem install sinatra```
- Web: ```gem install daemons```
- Web: ```gem install rack-test```
- You can install requirements in one command:
	-- ```
		cd path_to_bra_app_cloned_repo/ && gem install bundler && bundle 
	```

USAGE EXAMPLE
=============
```ruby bin/bra 83 102.6 cm france```

WEB
===
``` ruby ui.rb```
- To daemonize the Web app, use ```$~ ruby bra-app start|stop|status ```

WEB PROXY
=========
- Apache
``` 
        ProxyPass /bra http://localhost:4564/
        ProxyPassReverse /bra http://localhost:4564/
```

GEM USAGE
========
``` 
require 'bra'
include Bra
puts Bra.computer(80,100,'cm','france')
```

TEST
====
```rake test```

INSTALLATION
============
```
$~ sudo gem install bra
$~ bra 83 102 cm france
90F

```

LICENSE
=======

- GPL v2
