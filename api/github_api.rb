# frozen_string_literal: true

require 'github_client'
require 'serializers'

class GithubApi < BaseApi

  helpers do
    def client
      GithubClient.new settings.auth_token
    end
  end

  namespace '/v4' do
    get '/user/:login' do
      response = client.get_user(params[:login])
      if response['data']
        json Serializers::User.new(response['data'], :response).call
      elsif response['errors']
        json Serializers::Error.new(response['errors'], :response).call
      end
    end

    get '/user/:login/:repo' do
      response = client.get_user_repo(params[:login], params[:repo])
      
      if response['data']
        json Serializers::Repo.new(response['data'], :response).call
      elsif response['errors']
        json Serializers::Error.new(response['errors'], :response).call
      end
    end
  end
end