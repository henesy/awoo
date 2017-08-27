############################################
# => app.rb - Main Renderer
# => Awoo Textboard Engine
# => (c) prefetcher & github commiters 2017
#

require 'sinatra/base'
require 'sinatra/reloader'
require 'json'

require_relative 'routes/boards'
require_relative 'routes/errors'

class Awoo < Sinatra::Base
  def initialize
    super
    @instance = self
  end
  def instance
    @instance
  end
  register Sinatra::Awoo::Routing::Boards
  register Sinatra::Awoo::Routing::Errors
  configure do
    register Sinatra::Reloader
    set :bind, '0.0.0.0'
    set :port, config['port']
    set :awoo_version, '0.1.0'
    set :public_folder, File.dirname(__FILE__) + '/static'
    also_reload File.dirname(__FILE__) + '/config.json'
  end
  set :root, File.dirname(__FILE__)
  enable :sessions

  get '/' do
    erb :index
  end
end
