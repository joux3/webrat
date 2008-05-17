module Webrat
  class WangSession < Session

    def initialize(wang = WANG.new(:debug=>true))
      @wang = wang
    end
    
    def get(url, data)
	  data = data.map {|k,v| "#{WANG::Utils.escape(k)}=#{WANG::Utils.escape(v)}"}.join("&") if data.is_a?(Hash)
	  if data
		url += url.include?('?') ? "&#{data}" : "?#{data}"
	  end
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
