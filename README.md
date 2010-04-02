Growl-tweet
===========

This is a really simple script that makes use of the twitter and growl gems to connect to twitter, do a search for mentions of the username in state.yml, and create a growl notification for each one. state.yml also contains the last twitter id that it found that matched the search so that it doesn't show duplicates.

Dependencies
------------

* growlnotify
* bundler gem

Install
-------

1. Install growlnotify from the Growl disk image. 
2. Install the bundler gem `gem install bundler`. 
3. Run `bundle install`.
4. Copy or move `state.sample.yml` to `state.yml` and change the `name` value inside it.
5. Run `bundle exec ruby twitter.rb`