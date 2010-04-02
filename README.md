Growl-tweet
===========

This is a really simple script that makes use of the twitter and growl gems to connect to twitter, do a search for mentions of the username in state.yml, and create a growl notification for each one.

Dependencies
------------

* growlnotify
* bundler gem

Install
-------

1. Install growlnotify from the Growl disk image. 
2. Install the bundler gem `gem install bundler`. 
3. Run `bundle install`.
4. Run `bundle exec ruby twitter.rb`