require 'net/http'
require 'twitter'
require 'growl'

filename = 'state.yml'

def profile_image(user, img_url)
  if ! File.exist?(image_path(user)) || File.mtime(image_path(user)) < 7.days.ago
    download_image(user,img_url)
  end
  File.exist?(image_path(user)) ? image_path(user) : image_path(:default)
end

def image_path(user)
  if user == :default
    'profile_pics/default.png'
  else
    'profile_pics/' + user
  end
end

def download_image(user, img_url)
  begin
    image = Net::HTTP.get(URI.parse(img_url))
    f = File.new(image_path(user),'wb')
    f.write(image)
  ensure
    f.close unless f.nil?
  end
end

while(1) do
  File.open(filename,'r+') do |f|
    state = YAML::load(f)
    Twitter::Search.new("@" + state['name']).since(state['last_id']).sort do |a,b|
      a.id <=> b.id
    end.each do |s|
      Growl.notify do |n|
        n.image         = profile_image(s.from_user, s.profile_image_url)
        n.title         = "Tweet from #{s.from_user}"
        n.message       = s.text.gsub('&lt;','<').gsub('&gt;','>')
      end
      state['last_id'] = s.id unless s.id < state['last_id']
    end
    f.pos = 0
    f.print YAML.dump(state)
    f.truncate(f.pos)
  end
  sleep(60 * 1) # 1 minute
end