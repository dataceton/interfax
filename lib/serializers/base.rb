module Serializers
  class Base
    def initialize(root_key)
      @root_key = root_key
    end

    def with_root(data)
      response = if @root_key
        wrapper = {}
        wrapper[@root_key] = data
        wrapper
      else
        data
      end

      response
    end
  end
end