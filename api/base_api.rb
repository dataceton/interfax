# frozen_string_literal: true

class BaseApi < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::ConfigFile
  register Sinatra::Namespace

  config_file '../config/config.yml'

  get '/' do
    'Welcome to Interfax test application!'
  end
end