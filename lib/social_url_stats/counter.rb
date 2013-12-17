class SocialUrlStats::Counter
  attr_reader :url

  # Initialize with a URL, then use the methods below to get SUS.
  def initialize(url)
    @url = url
  end

  def fb_shares
    response = get_fb_graph
    shares = JSON.parse(response)['shares']
    return shares.nil? ? 0 : JSON.parse(response)['shares'].to_i
  end

  def fb_likes
    response = get_fb_graph
    likes = JSON.parse(response)['likes']
    return likes.nil? ? 0 : JSON.parse(response)['likes'].to_i
  end
 
  def tweets
    f = open("https://cdn.api.twitter.com/1/urls/count.json?url=#{@url}")
    return JSON.parse(f.read())['count'].to_i
  end
 
  # Pinterest pins
  def pins
    f = open("http://api.pinterest.com/v1/urls/count.json?url=#{@url}")
    return JSON.parse(f.read().gsub('receiveCount(','').gsub(')',''))['count'].to_i
  end
 
  def linkedin_shares
    f = open("http://www.linkedin.com/countserv/count/share?url=#{@url}&format=json")
    return JSON.parse(f.read())['count'].to_i
  end
 
  # StumbleUpon shares
  def stumbles
    f = open("http://www.stumbleupon.com/services/1.01/badge.getinfo?url=#{@url}")
    response = f.read()
    views = JSON.parse(response)['result']['views']
    return views.blank? ? 0 : JSON.parse(response)['result']['views'].to_i
  end
 
  # Google+
  def gplus_ones
    f = open("https://plusone.google.com/_/+1/fastbutton?url=#{URI::encode(url)}")
    response = f.read()
    shares = response[/window.__SSR = {c\: \d+.\d+/]
    return shares.nil? ? 0 : shares[/\d+.\d+/].to_i
  end

  protected

    # Store fb graph response so we don't make 2 hits if
    # getting shares & likes
    def get_fb_graph
      @fb_response ||= begin
        f = open("http://graph.facebook.com/?id=#{@url}")
        f.read()
      end
    end
end