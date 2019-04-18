require 'rubygems'
require 'bundler'

Bundler.require

# require 'sinatra/base'

require File.expand_path(File.join('api', 'base_api'))

Dir[File.join('api', '**/*_api.rb')].each { |file| require File.expand_path(file) }
