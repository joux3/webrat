module Webrat
  class WangSession < Session
    
    def initialize(wang = WANG.new)
      @wang = wang
    end
    
    def get(url, data)
	  # what to do with data?
      @response_status, @response_headers, @response_body = @wang.get(url)
    end

    def post(url, data)
      @response_status, @response_headers, @response_body = @wang.post(url, data)
    end

    def response_body
      @response_body
    end

    def response_code
      @response_status
    end
      
  end
end
