require 'timeout'
require 'socket'

class SocialUrlStats::Counter
  attr_reader :url

  HANDLED_OPEN_URI_EXCEPTIONS = [
    OpenURI::HTTPError, Timeout::Error, SocketError
  ]

  # Initialize with a URL, then use the methods below to get SUS.
  def initialize(url)
    @url = url
  end

  def fb_shares
    r = get_fb_graph
    return nil unless r 
    JSON.parse(r)['shares'].to_i
  end

  def fb_likes
    r = get_fb_graph
    return nil unless r 
    JSON.parse(r)['likes'].to_i
  end
 
  def tweets
    r = get_response("https://cdn.api.twitter.com/1/urls/count.json?url=#{@url}")
    return nil unless r 
    JSON.parse(r)['count'].to_i
  end
 
  # Pinterest pins
  def pins
    r = get_response("http://api.pinterest.com/v1/urls/count.json?url=#{@url}")
    return nil unless r 
    JSON.parse(r.gsub('receiveCount(','').gsub(')',''))['count'].to_i
  end
 
  def linkedin_shares
    r = get_response("http://www.linkedin.com/countserv/count/share?url=#{@url}&format=json")
    return nil unless r 
    JSON.parse(r)['count'].to_i
  end
 
  # StumbleUpon shares
  def stumbles
    r = get_response("http://www.stumbleupon.com/services/1.01/badge.getinfo?url=#{@url}")
    return nil unless r 
    JSON.parse(r)['result']['views'].to_i
  end
 
  # Google+
  def gplus_ones
    r = get_response("https://plusone.google.com/_/+1/fastbutton?url=#{URI::encode(url)}")
    return nil unless r 
    shares = r[/window.__SSR = {c\: \d+.\d+/]
    shares[/\d+.\d+/].to_i
  end

  protected

    def get_response(full_url)
      f = Timeout::timeout(10) { open(full_url) }
      response = f.read()
    rescue *HANDLED_OPEN_URI_EXCEPTIONS
      return nil
    end

    # Store fb graph response so we don't make 2 hits if
    # getting shares & likes
    def get_fb_graph
      @fb_response ||= begin
        get_response("http://graph.facebook.com/?id=#{@url}")
      end
    end
end