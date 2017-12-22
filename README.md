BRA SIZE COMPUTER
=================
- "HELP: ruby bra.rb UNDERBUST BUST UNIT [COUNTRY]"
- "HELP: ruby bra.rb UNDERBUST BUST UNIT [COUNTRY]"
- "HELP: Example: ruby bra.rb 83 102.6 cm"
- "HELP: Example: ruby bra.rb 35.1 41.5 inch"
- "HELP: Example: ruby bra.rb 35.1 41.5 inch europe"
- "HELP: Example: ruby bra.rb 83 102 inch france"

-- UNIT: cm or inch
-- COUNTRY: france or europe (if left empty defaults to USA)

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
	-- 
	```
		cd path_to_bra_app_cloned_repo/ && gem install bundler && bundle 
	```

USAGE EXAMPLE
=============
```ruby bin/bra 83 102.6 cm france```

WEB
===
``` ruby ui.rb```
- To daemonize the Web app, use 
	```
	$~ ruby bra-app start|stop|status 
	```

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

BUILD
=====
```
# Supposing hanynowsky is username in RubyGems.org
curl -u hanynowsky https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials
chmod 0600 ~/.gem/credentials
gem build bra.gemspec
gem push bra-1.0.1.gem
# After one minute
gem list -r bra

```

LICENSE
=======

- GPL v2
