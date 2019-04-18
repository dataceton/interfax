$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require File.expand_path(File.join('config', 'application'))

map('/') { run BaseApi }
map ('/api') { run GithubApi }