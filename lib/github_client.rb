# frozen_string_literal: true

class GithubClient
  ENDPOINT = 'https://api.github.com/graphql'

      def initialize(auth_token)
        @connection = Faraday.new ENDPOINT
        @auth_token = auth_token
      end

      def get_user(user)
        query = <<~GRAPHQL.gsub(/\n/, '')
          query {
            user(login: #{user}) {
              name
              repositories(last:10) {
                nodes {
                  name
                  createdAt
                }
              }
            }
          }
        GRAPHQL

        send_request(query: query)
      end

      def get_user_repo(user, repo)
        
      end


      private

      def send_request(params = {})
        response = @connection.post do |req|
          req.headers['Authorization'] = "bearer #{@auth_token}"
          # req.headers['Content-Type'] = 'application/json'
          req.body = params.to_json
        end

        JSON.parse response.body
      end
end