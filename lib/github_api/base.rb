module GithubApi
  class Base < Sinatra::Base
    register Sinatra::Reloader

    get '/' do
      'Welcome to Interfax test application!'
    end
  end
end