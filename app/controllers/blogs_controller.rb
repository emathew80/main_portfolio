require 'net/http'
require 'date'

class BlogsController < ApplicationController
  def index
    hash = getListOfPostsHash("https://medium.com/feed/@emathew.dev")
    posts = hash['rss']['channel']['item']
    links = []
    posts.each do |post|
      links.push(post['link'].split("?")[0]+"?format=json")
    end
    posts = []
    links.each do |link|
      hash = getPostHash(link)
      our_hash = get_our_hash(hash)
      posts.push(our_hash)
    end

    @medium_data = posts
  end
  def show
  end
  def codesnippets
    redirect_to root_path
 
  end

  def new 
    @post = Blog.new
  end

  def create
    @post = Blog.new(params[:title, :post])
    if @post.save?
        redirect_to blog_index_path
      end
  end


private

  def get_our_hash(hash)
    our_hash = {}
    hash = hash['payload']['value']
    our_hash['title'] = hash['title']
    epoch = hash['latestPublishedAt'].to_s[0..9]
    our_hash['latestPublishedAt'] = DateTime.strptime(epoch,'%s')
    our_hash['content'] = hash['content']['bodyModel']['paragraphs']
    return our_hash
  end

  def getListOfPostsHash(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
    xml = http.get(uri.request_uri).body
    return Hash.from_xml(xml)
  end

  def getPostHash(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE # read into this
    json = http.get(uri.request_uri).body.split("])}while(1);</x>")[1]
    return JSON.parse(json)
  end


end
