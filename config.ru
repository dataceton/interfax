require 'rubygems'
require 'bundler'

Bundler.require

$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require "github_api"

map('/') { run GithubApi::Base }