# SocialUrlStats

Give this ruby gem a URL, it will give you back how many times it's been shared / liked across various social networks.

**Currently polls**

- Facebook 
  - Shares
  - Likes
- Twitter
  - Tweets
- Pinterest
  - Pins
- LinkedIn
  - Shares
- Stumbleupon
  - Stumbles
- Google
  - +1s

Code liberally lifted from @maricris-sn, and turned into a gem with the intention to improve and maintain it. Original code here: https://gist.github.com/maricris-sn/7082858

## Installation

Add this line to your application's Gemfile:

    gem 'social_url_stats'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install social_url_stats

## Usage

Using is fairly simple…

    # Instantiate a SUS counter…
    sus = SocialUrlStats::Counter.new('http://cashboardapp.com')

    # Grab stats for your favorite social networks…
    sus.fb_shares
    sus.fb_likes
    sus.tweets
    sus.pins
    sus.linkedin_shares
    sus.stumbles
    sus.gplus_ones

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request