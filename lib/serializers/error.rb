module Serializers
  class Error < Base
    def initialize(error, root_key = nil)
      super(root_key)
      @error = error[0]
    end
    
    def call
      error_response = {
        error: @error['message']
      }

      with_root error_response
    end
  end
end
