module Serializers
  class Repo < Base
    def initialize(data, root_key)
      super(root_key)
      @data = data
    end
    
    def call
      user_name = @data['user']['name']
      user_repos = @data[]

      if user_data = @data['data']
        user_name = user_data['user']['name']
        user_repos = user_data['user']['repositories']['nodes']

        user = {
          user: {
            name: user_name
          },
          repositories: []
        }

        user_repos.each do |repo|
          user[:repositories] << {
            name: repo['name'],
            created_at: repo['createdAt']
          }
        end

        { response: user }
      end
    end
  end
end
