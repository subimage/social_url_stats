require File.expand_path '../test_helper.rb', __FILE__

class CounterTest < Minitest::Test
 
  def setup
    url = 'http://subimage.com'
    @sus = SocialUrlStats::Counter.new(url)
  end
 
  def test_fb_shares
    VCR.use_cassette('social_url_stats') do
      count = @sus.fb_shares
      assert_kind_of Integer, count
      assert_equal 10, count
    end
  end

  def test_fb_likes
    VCR.use_cassette('social_url_stats') do
      count = @sus.fb_likes
      assert_kind_of Integer, count
      assert_equal 0, count
    end
  end
 
  def test_tweets
    VCR.use_cassette('social_url_stats') do
      count = @sus.tweets
      assert_kind_of Integer, count
      assert_equal 7, count
    end
  end
 
  def test_pins
    VCR.use_cassette('social_url_stats') do
      count = @sus.pins
      assert_kind_of Integer, count
      assert_equal 0, count
    end
  end
 
  def test_linkedin_shares
    VCR.use_cassette('social_url_stats') do
      count = @sus.linkedin_shares
      assert_kind_of Integer, count
      assert_equal 3, count
    end
  end
 
  def test_stumbles
    VCR.use_cassette('social_url_stats') do
      count = @sus.stumbles
      assert_kind_of Integer, count
      assert_equal 130, count
    end
  end
 
  def test_gplus_ones
    VCR.use_cassette('social_url_stats') do
      count = @sus.gplus_ones
      assert_kind_of Integer, count
      assert_equal 1, count
    end
  end
  
end