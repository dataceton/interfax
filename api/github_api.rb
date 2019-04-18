# frozen_string_literal: true

require 'github_client'
require 'serializers/user_serializer'
require 'serializers/repo_serializer'

class GithubApi < BaseApi

  helpers do
    def client
      GithubClient.new settings.auth_token
    end
  end

  namespace '/v4' do
    get '/user/:login' do
      response = client.get_user(params[:login])

      if response[:errors].blank?
        json UserSerializer.new(response[:data]).call
      else
        json ErrorSerializer.new(response).call
      end
    end

    get '/user/:login/:repo' do
      response = client.get_user_repo(params[:login], params[:repo])
      
      if response[:errors].blank?
        json UserSerializer.new(response[:data]).call
      else
        json ErrorSerializer.new(response).call
      end
    end
  end
end