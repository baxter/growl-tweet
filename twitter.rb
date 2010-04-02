require 'twitter'
require 'growl'

filename = 'state.yml'

while(1) do
  File.open(filename,'r+') do |f|
    state = YAML::load(f)
    Twitter::Search.new("@" + state['name']).since(state['last_id']).sort do |a,b|
      a.id <=> b.id
    end.each do |s|
      Growl.notify do |n|
        n.image        = Dir.pwd + '/twittericon.png'
        n.title        = "Tweet from #{s.from_user}"
        n.message      = s.text.gsub('&lt;','<').gsub('&gt;','>')
      end
      state['last_id'] = s.id unless s.id < state['last_id']
    end
    f.pos = 0
    f.print YAML.dump(state)
    f.truncate(f.pos)
  end
  sleep(60 * 1) # 1 minute
end