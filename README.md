= Growl-tweet

This is a really simple script that makes use of the twitter and growl gems to connect to twitter, do a search for mentions of the username in state.yml, and create a growl notification for each one.

== Dependencies

* growlnotify
* bundler gem

== Install

# Install growlnotify from the Growl disk image. 
# Install the bundler gem `gem install bundler`. 
# Run `bundle install`.
# Run `bundle exec ruby twitter.rb`