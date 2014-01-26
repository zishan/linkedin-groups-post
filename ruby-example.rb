require 'linkedin'
require 'net-http-spy'
require 'json'


# get your api keys at https://www.linkedin.com/secure/developer
api_key = ''
api_secret = ''
user_token = ''
user_secret = ''

client = LinkedIn::Client.new(api_key, api_secret)

# authorize from previously fetched access keys
client.authorize_from_access(user_token, user_secret)


# you're now free to move about the cabin, call any API method

# list group ids we want to post to
# see http://developer.linkedin.com/forum/find-group-id
# or http://developer.linkedin.com/forum/how-get-group-id-profiles-0
gids = [
  2420986, # Built In Fairfield County
#  4321390, # SUWE Stamford
#  3805056, # CT Innovations Venture Community
#  138767,  # CT Technology Council
#  157739,  # CT Technology Networking Group
#  3736178, # Crossroads Venture Group
#  1174347, # CT Digital Media
#  2948885, # CT's Innovation Ecosystem
#  3814513, # New Haven Founders
#  4244283, # Stamford Innovation Center
#  4020407, # Startup Connecticut
]

# create group post hash 
# see https://developer.linkedin.com/documents/groups-api#create
post = {
  'title' => 'Hack of the Month - Zishan, 11/25/13',
  'summary' => 'Testing out the mass group post example.',
  'content' => {
    'submitted-url' => 'http://builtinct.org/profiles/blogs/stamford-tech-meetup-hack-of-the-month-11-25',
    'submitted-image-url' => 'http://m.c.lnkd.licdn.com/media-proxy/ext?w=100&h=80&hash=BdK91NC9XTWs%2FevjEaXnz0rGy6Q%3D&url=http%3A%2F%2Fphotos3.meetupstatic.com%2Fphotos%2Fevent%2Fb%2F0%2Fb%2Fa%2Fhighres_288585242.jpeg%3Fwidth%3D650',
    'title' => 'Stamford Tech Meetup - Hack of the Month - 11/25/13',
    'description' => "Don't you get tired of waiting and WAITING when all you want to do is SPAM a few LinkedIn groups?"
  }
}

gids.each do |gid|
  client.post_group_discussion(gid, post)
end

