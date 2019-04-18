module Serializers
  class Repo < Base
    def initialize(data, root_key)
      super(root_key)
      @repo = data['repository']
    end
    
    def call
      repo_name = @repo['name']
      commits = @repo.dig('ref', 'target', 'history', 'edges') || []

      repo = {
        repo: {
          name: repo_name,
          commits: []
        }
      }


      commits.each do |commit|
        cm_node = commit['node']
        repo[:repo][:commits] << { message: cm_node['message'], created_at: cm_node['committedDate'] }
      end

      with_root repo
    end
  end
end
