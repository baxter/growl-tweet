require 'twitter'
require 'growl'

state = YAML.load_file('state.yml')

Twitter::Search.new('@baxt3r').since('11427179802').each do |s|
  Growl.notify do |n|
    n.title = "Tweet from #{s.from_user}"
    n.message = s.text
  end
end
