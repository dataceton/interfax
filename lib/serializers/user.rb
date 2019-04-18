module Serializers
  class User < Base
    def initialize(data, root_key = nil)
      super(root_key)
      @user_data = data['user']
    end
    
    def call
      user = { 
        user: {
          name: @user_data['name']
        },
        repositories: []
      }

      repos = @user_data['repositories']['nodes']
      repos.each { |repo| user[:repositories] << { name: repo['name'], created_at: repo['createdAt'] } }

      with_root user
    end
  end
end