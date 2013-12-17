require File.expand_path '../test_helper.rb', __FILE__

class CounterTest < Minitest::Test
 
  class ErrorPrevention < Minitest::Test
    require 'timeout'
    require 'socket'
    def setup
      url = 'http://subimage.com'
      @sus = SocialUrlStats::Counter.new(url)
    end
    def expect_error(err)
      @sus.expects(:open).raises(err)
    end
    def test_timeout
      expect_error(Timeout::Error)
      assert_nil @sus.fb_likes
    end
    def test_404
      expect_error(OpenURI::HTTPError.new(404, StringIO.new))
      assert_nil @sus.fb_likes
    end
    def test_socket_error
      expect_error(SocketError)
      assert_nil @sus.fb_likes
    end
  end

  class Shares < Minitest::Test
    def setup
      url = 'http://subimage.com'
      @sus = SocialUrlStats::Counter.new(url)
    end
    def test_fb_shares
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        count = @sus.fb_shares
        assert_kind_of Integer, count
        assert_equal 10, count
      end
    end

    def test_fb_likes
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        count = @sus.fb_likes
        assert_kind_of Integer, count
        assert_equal 0, count
      end
    end

    # Ensure that we only hit the URL once if getting likes / shares
    def test_fb_graph_shared
      response = mock
      response.expects(:read)
        .times(1)
        .returns("{\"id\":\"http:\\/\\/subimage.com\",\"shares\":10}")
      @sus.expects(:open).times(1).returns(response)
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        @sus.fb_shares
        @sus.fb_likes
      end
    end
   
    def test_tweets
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        count = @sus.tweets
        assert_kind_of Integer, count
        assert_equal 7, count
      end
    end
   
    def test_pins
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        count = @sus.pins
        assert_kind_of Integer, count
        assert_equal 0, count
      end
    end
   
    def test_linkedin_shares
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        count = @sus.linkedin_shares
        assert_kind_of Integer, count
        assert_equal 3, count
      end
    end
   
    def test_stumbles
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        count = @sus.stumbles
        assert_kind_of Integer, count
        assert_equal 130, count
      end
    end
   
    def test_gplus_ones
      VCR.use_cassette('social_url_stats', :record => :new_episodes) do
        count = @sus.gplus_ones
        assert_kind_of Integer, count
        assert_equal 1, count
      end
    end

  end # /shares
  
end